class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :update, :destroy, :comments]
  before_action :authenticate_user, only: [:create, :update, :destroy, :current]
  before_action :authenticate_organization, only: [:create, :update, :destroy, :current], unless: -> { !current_user.nil? }

  # GET /pets
  def index
    @pets = Pet.paginate_by_sql(Pet.petsToAdopt, :page => @page, :per_page => 25)
    #puts @pets[:Pet_Size]
    #@pets = Pet.petsToAdopt
    render json: @pets
  end

  # GET /pets/1
  def show
    render json: @pet
  end

  # POST /pets
  def create
    puts current_user[:User_Email]
    @pet = Pet.new(pet_params)

    if @pet.save
      render json: @pet, status: :created, location: @pet
    else
      render json: @pet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pets/1
  def update
    if @pet.update(pet_params)
      render json: @pet
    else
      render json: @pet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pets/1
  def destroy
    @pet.destroy
  end

  def publications
    @pets = Pet.paginate_by_sql(Pet.petsToAdopt, :page => @page, :per_page => 25)
    #@pets = ActiveRecord::Base.connection.exec_query(Pet.petsToAdopt) 
    render json: @pets
  end

  def comments
    #post = Post.find(params[:id])
    render json: post.comments
  end
  
  def create_comments
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment, status: :created, location: comment
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  def losts
    @pets = Pet.paginate_by_sql(Pet.petsToFind, :page => @page, :per_page => 25)
    render json: @pets
  end

  def adopt
    @users = Pet.paginate_by_sql(Pet.waitToAdopt(params[:id]), :page => @page, :per_page => 25)
    render json: @users
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

    def comment_params
      params.require(:comment).permit(:Comment_Comment, :commenteable_type, :commenteable_id, :user_id)
    end
end
