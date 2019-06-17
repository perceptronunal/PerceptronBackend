class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :rol, only: [:update, :destroy]
  before_action :authenticate_login, only: [:update, :destroy]

  # GET /users
  def index
    @users = User.paginate(page: params[:page], per_page:25)

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
    
  end

  # POST /users
  def create
    @user = User.new(user_params)


    respond_to do |format|
      if @user.save
        # Tell the UserMailer to send a welcome email after save
        WelcomeMailer.welcome_email(@user).deliver_now
        format.json { render json: @user, status: :created, location: @user }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

    @login = Login.new(email: @user.User_Email, password_digest: @user.password_digest)
    @login.save
  end

  # PATCH/PUT /users/1
  def update
    if current_login[:id] == @user[:user_id]
      @login = Login.find_by(email: @user.User_Email)
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
      @login.update(email: @user.User_Email, password_digest: @user.password_digest)
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    Login.find_by(email: @user.User_Email).destroy
  end

  def likes
    @users = User.paginate_by_sql(User.usersToLikes(params[:id]), :page => @page, :per_page => 70)
    render json: @users
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:User_Name, :User_Email, :User_Phone, :User_City, :password)
    end

    def login_params
      params.require(:user).permit(:User_Email, :password)
    end

    def rol
      if !current_login.nil?
        @user = User.find_by(User_Email: current_login[:email])
        @organization = Organization.find_by(Organization_Email: current_login[:email])
      end
    end
end
