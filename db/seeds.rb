require 'faker'

50.times do
  Wiki.create!(
  title: Faker::Title.title 
  )

end
