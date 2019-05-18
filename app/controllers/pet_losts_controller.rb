class PetLostsController < ApplicationController
  before_action :set_pet_lost, only: [:show, :update, :destroy]

  # GET /pet_losts
  def index
    @pet_losts = PetLost.all

    render json: @pet_losts
  end

  # GET /pet_losts/1
  def show
    render json: @pet_lost
  end

  # POST /pet_losts
  def create
    @pet_lost = PetLost.new(pet_lost_params)

    if @pet_lost.save
      render json: @pet_lost, status: :created, location: @pet_lost
    else
      render json: @pet_lost.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pet_losts/1
  def update
    if @pet_lost.update(pet_lost_params)
      render json: @pet_lost
    else
      render json: @pet_lost.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pet_losts/1
  def destroy
    @pet_lost.destroy 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet_lost
      @pet_lost = PetLost.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pet_lost_params
      params.require(:pet_lost).permit(:PetLost_Type, :PetLost_Name, :PetLost_Gender, :PetLost_Size, :PetLost_Description, :PetLost_Found, :user_id)
    end
end
