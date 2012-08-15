class Tasklist < ActiveRecord::Base
  attr_accessible :end_date, :name, :start_date
  belongs_to :project
  validates :name, :presence => true

  validate :ensure_has_valid_date_range

  def ensure_has_valid_date_range
    if start_date? && end_date? && start_date >= end_date
      errors.add :start_date, "must occur before the end date"
    end
  end

end
