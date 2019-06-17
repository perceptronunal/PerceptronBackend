class GoogleAuthController < ApplicationController

  # POST /GoogleAuth
  def create
    id_token = g_auth_params[:id_token]
    response = HTTParty.get('https://oauth2.googleapis.com/tokeninfo?id_token=' + id_token)
    
    #converting to hash
    require 'json'
    body = JSON.parse(response.body) 

    #exception handling
    if response.code != 200
        render json: body
    else
        #look for user in Login table
        @user = Login.find_by(email: body["email"])
        if !@user.nil?

            #return knock token (simulate the create token behavior from login_token)
            auth_token = Knock::AuthToken.new payload: { sub: @user.id }
            render json: auth_token, status: :created
            
        else
            #create a new user assuming he/she is not an organization 
            #which means that organizations cant login through Google (so far). 
            @user=User.new(User_Name: body["name"], User_Email: body["email"], password: body["sub"])
            @user.save

            #add the new user to login
            @login = Login.new(email: @user.User_Email, password_digest: @user.password_digest)
            @login.save
            render json: @user
        end 
    end


    puts response.body, response.code, response.message, response.headers.inspect

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def g_auth_params
        params.require(:g_auth).permit(:id_token)
    end

end
