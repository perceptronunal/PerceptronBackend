# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Faker

100.times do
    Pet.create(
        Pet_Type: ["Perro", "Gato"].sample, 
        Pet_Name: Faker::Creature::Dog.name, 
        Pet_Gender: Faker::Creature::Dog.gender, 
        Pet_Age: Faker::Number.between(1,96), 
        Pet_Color: Faker::Color.color_name,
        Pet_Size: Faker::Creature::Dog.size, 
        Pet_Sterilized: Faker::Boolean.boolean,
        Pet_Vaccinated: Faker::Boolean.boolean,
        Pet_Description: Faker::Creature::Dog.meme_phrase,
        Pet_Visible: Faker::Boolean.boolean
    )
end

100.times do
    User.create(
        User_Name: Faker::Name.name_with_middle,
        User_Email: Faker::Internet.unique.free_email,
        User_Phone: Faker::PhoneNumber.cell_phone,
        User_City: Faker::Nation.capital_city,
        password: Faker::Games::LeagueOfLegends.champion
    )
end

100.times do
    Organization.create(
        Organization_Name: Faker::Name.name_with_middle,
        Organization_Address: Faker::Address.full_address,
        Organization_Phone: Faker::PhoneNumber.cell_phone,
        Organization_Email: Faker::Internet.unique.free_email,
        Organization_Website: Faker::Internet.url,
        Organization_Description: Faker::Lorem.word,
        Organization_Validation: Faker::Boolean.boolean,
        password: Faker::Games::LeagueOfLegends.champion
    )
end

100.times do
    case rand(1..2)
    when 1
        Connection.create(
            Connection_Type: ["Adoptar", "Publicar", "Adoptado", "Encontrado", "Perdido", "Interesado"].sample,        
            pet_id: Faker::Number.between(1, 100),
            connectable_id: Faker::Number.between(1, 100),
            connectable_type: User
        )
    when 2
        Connection.create(
            Connection_Type: ["Adoptar", "Publicar", "Adoptado", "Encontrado", "Perdido", "Interesado"].sample,        
            pet_id: Faker::Number.between(1, 100),
            connectable_id: Faker::Number.between(1, 100),
            connectable_type: Organization
        )
    else
        puts "error"
    end
end

100.times do
    Post.create(
        organization_id: Faker::Number.between(1, 100),
        Post_Title: Faker::Lorem.sentence,
        Post_Content: Faker::Lorem.paragraphs,
        Post_Tag: ["Evento", "Campaña", "Anuncio Mascota", "Noticia", "Sugerencia", "Voluntariado"].sample
    )    
end

100.times do
    case rand(1..4)
    when 1
        Resource.create(
            
            Resource_Type: Faker::File.extension,
            Resource_Link: Faker::File.file_name('https://petshappy2.s3-us-west-1.amazonaws.com'),
            resourceable_type: Pet,
            resourceable_id: Faker::Number.between(1, 100),
            filename: Faker::File.mime_type,
            bytesize: Faker::Number.between(1, 10000) 
        )
    when 2
        Resource.create(
            
            Resource_Type: Faker::File.extension,
            Resource_Link: Faker::File.file_name('https://petshappy2.s3-us-west-1.amazonaws.com'),
            resourceable_type: Post,
            resourceable_id: Faker::Number.between(1, 100),
            filename: Faker::File.mime_type,
            bytesize: Faker::Number.between(1, 10000) 
        )
    when 3
        Resource.create(
            
            Resource_Type: Faker::File.extension,
            Resource_Link: Faker::File.file_name('https://petshappy2.s3-us-west-1.amazonaws.com'),
            resourceable_type: User,
            resourceable_id: Faker::Number.between(1, 100),
            filename: Faker::File.mime_type,
            bytesize: Faker::Number.between(1, 10000) 
        )
    when 4
        Resource.create(
            
            Resource_Type: Faker::File.extension,
            Resource_Link: Faker::File.file_name('https://petshappy2.s3-us-west-1.amazonaws.com'),
            resourceable_type: Organization,
            resourceable_id: Faker::Number.between(1, 100),
            filename: Faker::File.mime_type,
            bytesize: Faker::Number.between(1, 10000) 
        )
    else
        puts "error"
    end
end

100.times do
    case rand(1..2)
    when 1
        Comment.create(
            Comment_Comment: Faker::Lorem.paragraph,
            commenteable_type: Pet,
            commenteable_id: Faker::Number.between(1, 100),
            user_id: Faker::Number.between(1, 100)
        )
    when 2
        Comment.create(
            Comment_Comment: Faker::Lorem.paragraph,
            commenteable_type: Post,
            commenteable_id: Faker::Number.between(1, 100),
            user_id: Faker::Number.between(1, 100)
        )
    else
        puts "error"
    end
end

100.times do
    case rand(1..2)
    when 1
        Profilepicture.create(
            
            ProfilePicture_Link: Faker::File.file_name('https://petshappy2.s3-us-west-1.amazonaws.com'),
            profilepicturesable_type: User,
            profilepicturesable_id: Faker::Number.between(1, 100),
            ProfilePicture_Filename: Faker::File.mime_type,
            ProfilePicture_Bytesize: Faker::Number.between(1, 10000) 
        )
    when 2
        Profilepicture.create(
            
            ProfilePicture_Link: Faker::File.file_name('https://petshappy2.s3-us-west-1.amazonaws.com'),
            profilepicturesable_type: Organization,
            profilepicturesable_id: Faker::Number.between(1, 100),
            ProfilePicture_Filename: Faker::File.mime_type,
            ProfilePicture_Bytesize: Faker::Number.between(1, 10000) 
        )
    else
        puts "error"
    end
end