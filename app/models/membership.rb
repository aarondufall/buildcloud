class Membership < ActiveRecord::Base

  belongs_to :target, polymorphic: true
  belongs_to :user
  belongs_to :team

  validates :target, presence: true
  validate  :has_user_or_team

  module HasMembersMixin
    extend ActiveSupport::Concern

    included do
      has_many :memberships,  as: :target
      has_many :users, through: :memberships
    end

    module ClassMethods

      def directly_accessible_by(user)
        nil
      end

      def accessible_by(user)
        conditions = Membership.arel_for_user_or_their_teams(user)
        if direct_conditions = directly_accessible_by(user)
          conditions = conditions.or(direct_conditions)
        end
        includes(:memberships).where conditions
      end

    end

    def has_access?(user)
      memberships.for_user_directly(user).exists?
    end

    def give_user_access(user)
      memberships.for_user_directly(user).create
    end

    def remove_users_access(user)
      memberships.for_user_directly(user).destroy_all
    end

    def give_team_access(team)
      memberships.for_team(team).create
    end

    def remove_teams_access(team)
      memberships.for_team(team).destroy_all
    end

  end

  def self.for_user_directly(user)
    where(user_id: user)
  end

  def self.for_team(team)
    where(team_id: team)
  end

  def self.for_user_their_teams(user)
    where arel_for_user_or_their_teams(user)
  end

  def self.arel_for_user_or_their_teams(user)
    team_ids = user.team_ids
    user_column = arel_table[:user_id]
    team_column = arel_table[:team_id]
    user_conditions = user_column.eq(user.id)
    if team_ids.any?
      team_column.in(team_ids).or user_conditions
    else
      user_conditions
    end
  end

  def has_user_or_team
    if user.blank? && team.blank?
      errors.add :user, :specify_user_or_team
      errors.add :team, :specify_user_or_team
    elsif user.present? && team.present?
      errors.add :user, :both_user_or_team
      errors.add :team, :both_user_or_team
    end
  end

end
