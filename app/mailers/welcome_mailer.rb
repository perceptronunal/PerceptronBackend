class WelcomeMailer < ApplicationMailer

    def welcome_email(user)
        @user = user
        mail(to: user.User_Email, subject: 'Welcome to HappyPets')
    end

    def youHaveAdoptedUSer(user)
        @user = user
        mail(to: user.User_Email, subject: 'Congratulations')
    end

    def youHaveAdoptedOrganization(organization)
        @organization = organization
        mail(to: organization.User_Email, subject: 'Congratulations')
    end

end
