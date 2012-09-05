class Contact < ActiveRecord::Base
  attr_accessible :address, :company, :email, :first_name, :last_name, :phone
  belongs_to :team
  validates :team, presence: true
  validates :email, presence: true

  # before_save :store_display_name

  def display_name
    "#{first_name} #{last_name}".strip.presence || email
  end

  # Makes it possible to search on the full name, not just the email.
  def store_display_name
    self.stored_display_name = display_name
  end

  def self.search_for_autocomplete(text)
    where("email LIKE ?", "#{text}%").limit(10)
  end

  def to_autocomplete_hash
    {
      id:   email,
      name: display_name,
      type: "Contact"
    }
  end

end
