class ConnectionsController < ApplicationController
  before_action :set_connection, only: [:show, :update, :destroy]

  # GET /connections
  def index
    @connections = Connection.paginate(page: params[:page], per_page:25)

    render json: @connections
  end

  # GET /connections/1
  def show
    render json: @connection
  end

  # POST /connections
  def create
    @connection = Connection.new(connection_params)

    if @connection.save
      render json: @connection, status: :created, location: @connection
    else
      render json: @connection.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /connections/1
  def update
    if @connection.update(connection_params)
      render json: @connection
    else
      render json: @connection.errors, status: :unprocessable_entity
    end
  end

  # DELETE /connections/1
  def destroy
    @connection.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_connection
      @connection = Connection.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def connection_params
      params.require(:connection).permit(:Connection_Type, :pet_id, :user_id, :organization_id)
    end
end
