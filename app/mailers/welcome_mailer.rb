class WelcomeMailer < ApplicationMailer

    def welcome_email(user)
        @user = user
        mail(to: user.User_Email, from:"happypets.perceptron@gmail.com", subject: 'Welcome to HappyPets', message:"Bienvenido")
    end

    def receive_email(user)
        @name = user.name
        @email = user.email
        @body = user.message
        mail(to:"happypets.perceptron@gmail.com", from:"happypets.perceptron@gmail.com", subject: @name, message: @body)
    end

    def you_have_adopted_user(user, pet, owner)
        @user = user
        @pet = pet
        @owner = owner
        mail(to: @user.User_Email, from:"happypets.perceptron@gmail.com", subject: 'Congratulations', message: ":)")
    end

    def you_have_adopted_organization(organization, pet, owner)
        @organization = organization
        @pet = pet
        @owner = owner
        mail(to: organization.User_Email, from:"happypets.perceptron@gmail.com", subject: 'Congratulations', message: "XD")
    end

end
