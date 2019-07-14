class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :update, :destroy, :comments, :create_interest, :confirm_adoption, :create_adoption, :adopt, :found]
  #before_action :authenticate_user, only: [:create, :show, :update, :destroy, :create_comments, :found]
  #before_action :authenticate_organization, only: [:create, :update, :destroy, :found], unless: -> { !current_user.nil? }
  before_action :rol, only: [:show, :create, :update, :destroy, :create_comments, :create_interest, :confirm_adoption, :create_adoption, :adopt, :found]
  before_action :authenticate_login, only: [:show, :create, :update, :destroy, :create_comments, :create_interest, :confirm_adoption, :create_adoption, :adopt, :found]

  # GET /pets
  def index
    @pets = Pet.paginate_by_sql(Pet.petsToAdopt, :page => @page, :per_page => 25)
    #puts @pets[:Pet_Size]
    #@pets = Pet.petsToAdopt
    render json: @pets, each_serializer: PetIndexSerializer
  end

  # GET /pets/1
  def show
    
    #render json: @pet
    respond_to do |format|
      format.json {render json: @pet, serializer: PetShowSerializer}
      format.pdf do
        pdf = PetPdf.new(@user.id, adopter[:user_id])
        send_data pdf.render,
          filename: "contrato.pdf",
          type: 'application/pdf',
          disposition: 'inline'
      end
    end
  end

  # POST /pets
  def create
  
    @pet = Pet.new(pet_params)
    if @pet.save
      if @user != nil
        @connection = Connection.new(Connection_Type: request_parameter[:Connection_Type], pet_id: @pet[:id], connectable_type: User, connectable_id: @user.id)
      else
        @connection = Connection.new(Connection_Type: request_parameter[:Connection_Type], pet_id: @pet[:id], connectable_type: Organization, connectable_id: @organization.id)
      end
      @connection.save
      render json: @pet, status: :created, location: @pet, serializer: PetSerializer
    else
      render json: @pet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pets/1
  def update
#    if  (Connection.find_by(pet_id: @pet[:id])[:connectable_id] == @user[:id] && Connection.find_by(pet_id: @pet[:id])[:connectable_type] == "User") || (Connection.find_by(pet_id: @pet[:id])[:connectable_id] == @organization[:id] && Connection.find_by(pet_id: @pet[:id])[:connectable_type] == "Organization")
      if @pet.update(pet_params)
        render json: @pet, serializer: PetSerializer
      else
        render json: @pet.errors, status: :unprocessable_entity
      end
#    end
  end

  # DELETE /pets/1
  def destroy
    @pet.destroy
  end

  def publications
    @connections = Connection.where(Connection_Type: "Publicar")
    @connections.paginate(page: params[:page], per_page: 50)
    render json: @connections, each_serializer: ConnectionSerializer, include: ['connectable', 'pet', 'pet.connections','pet.comments.user']
  end

  def create_comments
    comment = Comment.new(Comment_Comment: comment_params[:Comment_Comment], commenteable_type: "Pet", commenteable_id: params[:id], user_id: @user.id)
    if comment.save
      render json: comment, status: :created, location: comment, serializer: CommentSerializer
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  def losts
    @connections = Connection.where(Connection_Type: "Perdido")
    @connections.paginate(page: params[:page], per_page: 50)
    render json: @connections, each_serializer: ConnectionSerializer, include: ['connectable', 'pet', 'pet.connections','pet.comments.user']
  end

  def adopt
    @users = Pet.paginate_by_sql(Pet.waitToAdopt(params[:id]), :page => @page, :per_page => 25)
    render :json => @users.to_json
  end

  def create_interest
    @connection = Connection.new(Connection_Type: "Interesado", pet_id: @pet[:id], connectable_type: User, connectable_id: @user.id)
    if @connection.save
      render json: @connection, status: :created, location: @connection, serializer: ConnectionSerializer
    else
      render json: @connection.errors, status: :unprocessable_entity
    end
  end

  def create_adoption
    @connection = Connection.new(Connection_Type: "Adoptar", pet_id: @pet[:id], connectable_type: User, connectable_id: @user.id)
    if @connection.save
      render json: @connection, status: :created, location: @connection, serializer: ConnectionSerializer
    else
      render json: @connection.errors, status: :unprocessable_entity
    end
  end

  def confirm_adoption
    @connection = Connection.new(Connection_Type: "Adoptado", pet_id: @pet[:id], connectable_type: User, connectable_id: adopter[:user_id])
    if @connection.save
      render json: @connection, status: :created, location: @connection, serializer: ConnectionSerializer
    else
      render json: @connection.errors, status: :unprocessable_entity
    end
    
    if (@connection.connectable_type == "User")
      WelcomeMailer.you_have_adopted_user(User.find(@connection.connectable_id), Pet.find(@connection.pet_id), ).deliver_now!
    else
      WelcomeMailer.you_have_adopted_organization(Organization.find(@connection.connectable_id)).deliver_now!
    end
    
    if @pet.update(Pet_Visible: false)
      render json: @pet, serializer: PetSerializer
    else
      render json: @pet.errors, status: :unprocessable_entity
    end
  end

  def found
    if(@user != nil)
      @connection = Connection.new(Connection_Type: "Encontrado", pet_id: @pet[:id], connectable_type: User, connectable_id: @user.id)
    else
      @connection = Connection.new(Connection_Type: "Encontrado", pet_id: @pet[:id], connectable_type: Organization, connectable_id: @organization.id)
    end
    @connection.save

    if @pet.update(Pet_Visible: false)
      render json: @pet, serializer: PetSerializer
    else
      render json: @pet.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pet_params
      params.require(:pet).permit(:Pet_Type, :Pet_Name, :Pet_Gender, :Pet_Age, :Pet_Size, :Pet_Color, :Pet_Sterilized, :Pet_Vaccinated, :Pet_Description, :Pet_Visible)
    end

    def request_parameter
      params.require(:pet).permit(:Connection_Type)
    end

    def adopter
      params.require(:pet).permit(:user_id)
    end

    def comment_params
      params.require(:comment).permit(:Comment_Comment)
    end

    def rol
      if !current_login.nil?
        @user = User.find_by(User_Email: current_login[:email])
        @organization = Organization.find_by(Organization_Email: current_login[:email])
      end
    end
end
