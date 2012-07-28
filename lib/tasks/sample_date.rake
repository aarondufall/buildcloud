namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    user = User.create!(email: "test@example.com",
                 password: "123qwe",
                 password_confirmation: "123qwe")
    99.times do |n|
      email = Forgery::Internet.email_address
      password  = "password"
      user = User.create!(email: email,
                   password: password,
                   password_confirmation: password)
    end 
  end
end