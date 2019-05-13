# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Faker

100.times do
    User.create(
        User_Name: Faker::Name.name_with_middle,
        User_Email: Faker::Internet.unique.free_email,
        User_Phone: Faker::PhoneNumber.cell_phone,
        User_City: Faker::Nation.capital_city

    )
end

100.times do
    InterestedIn.create(
        #Interest_type should be edited
        #
        Interest_Type: Faker::Creature::Animal.name,
        user_id: Faker::Number.between(1, 100)

    )
end