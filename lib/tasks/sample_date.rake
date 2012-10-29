namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    name = Forgery::Name.full_name
    company_name = Forgery::Name.company_name
    user = User.create!(:profile_attributes => { name: name, company: company_name },
                  email: "test@example.com",
                  password: "123qwe",
                  password_confirmation: "123qwe")
    account = user.create_account(name: company_name)
    account.give_user_access(user)
    10.times do |n|
      name = Forgery::Name.full_name
      company_name = Forgery::Name.company_name
      email = Forgery::Internet.email_address
      password  = "password"
      user = account.users.create!(:profile_attributes => { name:  name, company: company_name },email: email,
                   password: password,
                   password_confirmation: password)
    end 
  end
end