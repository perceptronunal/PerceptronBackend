class LoginsController < ApplicationController
    before_action :rol, only: [:current]
    before_action :authenticate_login, only: [:current]

    def current
      if @user != nil
        render json: { user: @user }
      end
      if @organization != nil
        render json: { organization: @organization }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def rol
      if !current_login.nil?
        @user = User.find_by(User_Email: current_login[:email])
        @organization = Organization.find_by(Organization_Email: current_login[:email])
      end
    end
end
