class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :update, :destroy]

  # GET /pets
  def index
    @pets = Pet.all

    render json: @pets
  end

  # GET /pets/1
  def show
    render json: @pet
  end

  # POST /pets
  def create
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
    #destroys every comment of an pet before destroys pet himself
    #(referencial integrity from rails side)
    @comment = Comment.where(pet_id: @pet.id)
    @comment.each do |tempcomment|
      tempcomment.destroy
    end

    #destroys every resource of an pet before destroys pet himself
    #(referencial integrity from rails side)
    @resource = Resource.where(pet_id: @pet.id)
    @resource.each do |tempresource|
      tempresource.destroy
    end

    #destroys every interest of an pet before destroys pet himself
    #(referencial integrity from rails side)
    @interested_in = InterestedIn.where(pet_id: @pet.id)
    @interested_in.each do |int_in|
      int_in.destroy
    end

    @pet.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pet_params
      params.require(:pet).permit(:Pet_Type, :Pet_Name, :Pet_Gender, :Pet_Age, :Pet_Size, :Pet_Sterilized, :Pet_Vaccinated, :PetLost_Description, :Pet_Adopted)
    end
end
