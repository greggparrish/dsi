if User.count < 10
  50.times do |c|
    userpass = Faker::Internet.password
    User.create! [
      created_at: Faker::Time.between(2.years.ago, Date.today, :all),
      username: Faker::Internet.user_name, 
      email: Faker::Internet.safe_email,
      password: userpass,
      password_confirmation: userpass
    ]
  end
end

 
