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

    Pet.create(
        # 0 = dog, 1 = cat, 2 = rabbit
        Pet_Type: Faker::Number.between(0,2), 
        Pet_Name: Faker::Creature::Dog.name, 
        Pet_Gender: Faker::Creature::Dog.gender, 
        # meses
        Pet_Age: Faker::Number.between(1,96), 
        Pet_Size: Faker::Creature::Dog.size, 
        Pet_Sterilized: Faker::Boolean.boolean,
        Pet_Vaccinated: Faker::Boolean.boolean,
        Pet_Description: Faker::Creature::Dog.meme_phrase,
        Pet_Adopted: Faker::Boolean.boolean
    )

   

end

100.times do
    
    InterestedIn.create(
        #Interest_type should be edited
        #
        Interest_Type: Faker::Creature::Animal.name,
        user_id: Faker::Number.between(1, 100),
        pet_id: Faker::Number.between(1, 100)
    )
    
end

100.times do


    Organization.create(
        Organization_Name: Faker::Name.name_with_middle,
        Organization_Address: Faker::Address.full_address,
        Organization_Phone: Faker::PhoneNumber.cell_phone,
        Organization_Email: Faker::Internet.unique.free_email,
        Organization_Website: Faker::Internet.url,
        Organization_Description: Faker::Lorem.word
    )
end



100.times do
    Post.create(
        organization_id: Faker::Number.between(1, 100),
        Post_Title: Faker::Lorem.sentence,
        Post_Content: Faker::Lorem.paragraphs,
    )

    PetLost.create(
        user_id: Faker::Number.between(1, 100),
        PetLost_Type: Faker::Number.between(0,2),
        PetLost_Name: Faker::Creature::Dog.name,
        PetLost_Gender: Faker::Creature::Dog.gender,
        # meses
        PetLost_Size: Faker::Creature::Dog.size,
        PetLost_Description: Faker::Creature::Dog.meme_phrase,
        PetLost_Found: Faker::Boolean.boolean
    )
end

100.times do
    
    
    
    case rand(1..3)
    when 1
        Comment.create(
            Comment_Comment: Faker::Lorem.paragraph,
            commenteable_type: Pet,
            commenteable_id: Faker::Number.between(1, 100)
        )
    when 2
        Comment.create(
            Comment_Comment: Faker::Lorem.paragraph,
            commenteable_type: PetLost,
            commenteable_id: Faker::Number.between(1, 100)
        )
    when 3
        Comment.create(
            Comment_Comment: Faker::Lorem.paragraph,
            commenteable_type: Post,
            commenteable_id: Faker::Number.between(1, 100)
        )
    else
        puts "we're fucked!"
    end
        
        
    case rand(1..5)
    when 1
        Resource.create(
            
            Resource_Type: Faker::Lorem.word,
            Resource_Link: Faker::Internet.url,
            resourceable_type: Pet,
            resourceable_id: Faker::Number.between(1, 100) 
        )
    when 2
        Resource.create(
            
            Resource_Type: Faker::Lorem.word,
            Resource_Link: Faker::Internet.url,
            resourceable_type: PetLost,
            resourceable_id: Faker::Number.between(1, 100) 
        )
    when 3
        Resource.create(
            
            Resource_Type: Faker::Lorem.word,
            Resource_Link: Faker::Internet.url,
            resourceable_type: Post,
            resourceable_id: Faker::Number.between(1, 100) 
        )
    when 4
        Resource.create(
            
            Resource_Type: Faker::Lorem.word,
            Resource_Link: Faker::Internet.url,
            resourceable_type: User,
            resourceable_id: Faker::Number.between(1, 100) 
        )
    when 5
        Resource.create(
            
            Resource_Type: Faker::Lorem.word,
            Resource_Link: Faker::Internet.url,
            resourceable_type: Organization,
            resourceable_id: Faker::Number.between(1, 100) 
        )
    else
        puts "we're fucked!"
    end
        
end