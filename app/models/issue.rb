class Issue < ActiveRecord::Base
  attr_accessible :assigned_to_id, :closed_at, :description, :title, :todo_id, :issue_type, :created_by_id, :email_tokens
  belongs_to :todo
  belongs_to :user, :class_name => "User", :foreign_key => 'assigned_to_id'
  belongs_to :project
  belongs_to :created_by, :class_name => "User", :foreign_key => 'created_by_id'
  validates :title, :presence => true
  validates :issue_type, :presence => true
  validates :created_by, :presence => true

  has_many :recipients, class_name: "IssueRecipient"
  has_many :users,      through: :recipients
  has_many :contacts,   through: :recipients
  has_many :follow_ups

  def self.opened
    where closed_at: nil
  end

  def self.closed
    where "closed_at IS NOT NULL"
  end

  def emails
    @emails ||= recipients.map(&:email)
  end

  def emails=(value)
    self.recipients = recipients.from_emails(Array(value), project.team)
    @emails = recipients.map(&:email)
  end

  def email_tokens=(value)
    self.emails = value.to_s.split(",").map(&:strip).uniq
  end

  def email_tokens
    emails.join(",")
  end

  def current_email_details
    recipients.map &:to_autocomplete_hash
  end

  def close!
    update_attributes closed_at: Time.now
  end

  def reopen!
    update_attributes closed_at: nil
  end
end
