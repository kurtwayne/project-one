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

# Create and admin user
admin = User.create!(
name:     'Admin User',
   email:    'kurtwgardner@gmail.com',
   password: 'helloworld',
   role:     'admin'
)

puts "Faker Seed Finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
