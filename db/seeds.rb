require 'faker'

5.times do
   User.create!(
    # name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
   )
 end
 users = User.all

25.times do
  Wiki.create!(
   title: Faker::Lorem.sentence,
   body: Faker::Lorem.paragraph
  )
end
wikis = Wiki.all

# Create an admin user
admin = User.create!(
   email:    'kurtwgardner@gmail.com',
   password: 'helloworld',
   role:     'admin'
)

# Create a Premium User
premium = User.create!(
   email:    'kurt@gmail.com',
   password: 'helloworld',
   role:     'premium'
)

# Create a Standard User
standard = User.create!(
  email:    'wayne@gmail.com',
  password: 'helloworld',
  role:     'standard'
)

puts "Faker Seed Finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
