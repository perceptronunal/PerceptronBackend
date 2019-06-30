class ContactController < ApplicationController

    def contact
        @contact = Contact.new(contact_params)
        WelcomeMailer.receive_email(@contact).deliver_now!
        render json: @contact
    end

    private

    def contact_params
        params.require(:contact).permit(:name, :email, :message)
    end
end
