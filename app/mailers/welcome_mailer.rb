class WelcomeMailer < ApplicationMailer

    def welcome_email(user)
        @user = user
        mail(to: user.User_Email, from:"happypets.perceptron@gmail.com", subject: 'Welcome to HappyPets', message:"Bienvenido")
    end

    def you_have_adopted_user(user)
        @user = user
        mail(to: @user.User_Email, from:"happypets.perceptron@gmail.com", subject: 'Congratulations', message: ":)")
    end

    def you_have_adopted_organization(organization)
        @organization = organization
        mail(to: organization.User_Email, from:"happypets.perceptron@gmail.com", subject: 'Congratulations', message: "XD")
    end

end
