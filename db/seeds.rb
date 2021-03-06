# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# How to use Faker
# 1) Go to https://github.com/faker-ruby/faker/blob/master/doc/default/food.md
# 2) Then go to any category you want
# 3) After picking and clicking on the category,
# it will lead you to its show page
# 4) Pick a random name/description/phrase (example: Faker::Food.sushi #=> "Sea bream")
# 5) Put it on an attribute (example: name: Faker::Food.sushi)
# 6) Run " rails db:migrate:reset db:seed "
# 7) Now check all your users! Enjoy.

50.times do |n|  #fakerを決めた
    User.create(
       name: Faker::Food.dish, # example: Mushroom Risotto
       email: "user#{n+1}@email.com", # example: user1@email.com
       password: "password"
   )
end


User.create!(
    name: "Admin User",
    email: "admin@gmail.com",
    password: "password",
    admin: true
)

20.times do |n|
    title = Faker::Name.unique.name
    description =  "Lorem Epsum"
    Category.create!(title: title,description: description)
  
    10.times do
      content = Faker::Lorem.word
      word = Category.all.sample.words.build content: content
      word.choices = [
        Choice.new(content: content, correct: true),
        Choice.new(content: Faker::Music.instrument, correct: false),
        Choice.new(content: Faker::Music.chord, correct: false)
      ].shuffle
      word.save(validate: false)
    end
  end