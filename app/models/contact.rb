class Contact < ActiveRecord::Base
  attr_accessible :address, :company, :email, :first_name, :last_name, :phone
  belongs_to :team
end
