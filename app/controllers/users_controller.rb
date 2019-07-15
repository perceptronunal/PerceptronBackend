class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :user_comments]
  before_action :rol, only: [:update, :destroy, :upload_profile]

  # GET /users
  def index
    @users = User.paginate(page: params[:page], per_page:25)
    render json: @users
  end

  # GET /users/1
  def show
    render json: @user, serializer: UserShowSerializer
  end

  def user_comments
    render json: Comment.where(user_id: @user.id)
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      # Tell the UserMailer to send a welcome email after save
      WelcomeMailer.welcome_email(@user).deliver_now!
      
      @resource = profile_default(User.find_by(User_Email: @user.User_Email))
      @resource.save

      render json: @user, status: :created, location: @user, root: "user", adapter: :json
      
    else
      render json: @user.errors, status: :unprocessable_entity, root: "user", adapter: :json
    end
    
  end

  def upload_profile
    @old_resource = @user_aut.resources.where(Resource_Type: 'profile').first
    
    
    if @old_resource != nil
      @old_resource.destroy
    else
      puts "no habia nada"
    end

    new_resource = Resource.new(file: resource_params[:file], resourceable_type: "User", resourceable_id: @user_aut.id, Resource_Type: 'profile')
    
    if new_resource.save
      puts "bien"
    else
      puts "mal"
    end

    update_resource = @user_aut.resources.where(Resource_Type: 'profile').first

    if update_resource != nil
      link = 'https://petshappy2.s3-us-west-1.amazonaws.com/'+ update_resource.file.key
      file_name = ActiveStorageBlob.find(ActiveStorageAttachment.all().last.id).filename
      byte_size = ActiveStorageBlob.find(ActiveStorageAttachment.all().last.id).byte_size

      if update_resource.update(Resource_Link: link, bytesize: byte_size, filename: file_name)
        render json: update_resource, status: 200
      else
        render json: update_resource.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user_aut.id == @user.id
      if @user.update(user_params_update)
       render json: @user, status: 200, location: @user
      else
       render json: @user.errors, status: :unprocessable_entity
      end
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

    def profile_default(user)
      Resource.create(
        Resource_Type: "profile",
        Resource_Link: "https://petshappy2.s3-us-west-1.amazonaws.com/user.png",
        resourceable_type: "User",
        resourceable_id: user.id,
        filename: "user.png",
        bytesize: 6000
      )
    end

    def rol
      if !current_login.nil?
        @user_aut = User.find_by(User_Email: current_login[:email])
        @organization_aut = Organization.find_by(Organization_Email: current_login[:email])
      end
    end
end
