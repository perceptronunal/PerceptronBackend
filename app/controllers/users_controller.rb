class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :user_comments]
  before_action :rol, only: [:update, :destroy]
  before_action :authenticate_login, only: [:update, :destroy, :upload_profile]

  # GET /users
  def index
    @users = User.paginate(page: params[:page], per_page:25)
    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  def user_comments
    render json: Comment.where(user_id: @user.id)
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      # Tell the UserMailer to send a welcome email after save
      @login = Login.new(email: @user.User_Email, password_digest: @user.password_digest)
      @login.save
      WelcomeMailer.welcome_email(@user).deliver_now!
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end

    @login = Login.new(email: @user.User_Email, password_digest: @user.password_digest)
    @login.save
  end

  def upload_profile
    resource = Resource.new(file: resource_params[:file], resourceable_type: "User", resourceable_id: @user_aut.id)
    
    if resource.save
      link = 'https://petshappy2.s3-us-west-1.amazonaws.com/'+ resource.file.key
      file = ActiveStorageBlob.find(ActiveStorageAttachment.all().last.id).filename
      byte = ActiveStorageBlob.find(ActiveStorageAttachment.all().last.id).byte_size
      #type = ActiveStorageBlob.find(ActiveStorageAttachment.all().last.id).content_type
      type = 'profile'
      
      resource.update(Resource_Link: link, filename: file, bytesize: byte, Resource_Type: type)
      
      render :json => resource, status: :created, location: resource
    else
      render :json => resource.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user_aut.id == @user.id
      @login = Login.find_by(email: @user.User_Email)
      if @user.update(user_params_update)
       render json: @user, status: :created, location: @user
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
    @connections = User.paginate_by_sql(User.usersToLikes(params[:id]), :page => @page, :per_page => 70)
    render json: @connections, each_serializer: ConnectionSerializer
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

    def user_params_update
      params.require(:user).permit(:User_Name, :User_Email, :User_Phone, :User_City)
    end

    def resource_params
      params.permit(:file)
    end

    def login_params
      params.require(:user).permit(:User_Email, :password)
    end

    def rol
      if !current_login.nil?
        @user_aut = User.find_by(User_Email: current_login[:email])
        @organization_aut = Organization.find_by(Organization_Email: current_login[:email])
      end
    end
end
