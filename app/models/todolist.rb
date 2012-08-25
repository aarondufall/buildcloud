class Todolist < ActiveRecord::Base
  attr_accessible :end_date, :name, :start_date
  belongs_to :project

  has_many :todos do

    def in_progress
      reject { |r| r.completed_at? }
    end

    def completed
      select { |r| r.completed_at? }
    end

  end

  validates :name, :presence => true


  validate :ensure_usable_date_entry

  def ensure_usable_date_entry
  	if start_date? && !end_date?
  		errors.add :start_date, "Cannot enter a start date without a completion date"
  	else
  		ensure_has_valid_date_range
  	end
  end

  def ensure_has_valid_date_range
    if start_date? && end_date? && start_date >= end_date
      errors.add :start_date, "must occur before the end date"
    end
  end

end
