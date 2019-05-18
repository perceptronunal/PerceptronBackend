class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]

  # GET /comments
  def index
    @comments = Comment.all

    render json: @comments
  end

  # GET /comments/1
  def show
    render json: @comment
  end

  # POST /comments
  def create
   
    type = comment_params[:Comment_Type]
    id = comment_params[:Comment_Id]

    case type
    when "post"
      @post = Post.find(id)
      @comment = @post.comments.new(comment_params2) 
    when "pet_lost"
      @pet_lost = PetLost.find(id)
      @comment = @pet_lost.comments.new(comment_params2) 
    when "pet"
      @pet = Pet.find(id)
      @comment = @pet.comments.new(comment_params2) 
    else

    end

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # def set_pet_lost
    #   @pet_lost = PetLost.find(params[:id])
    # end

    # def set_pet
    #   @pet = Pet.find(params[:id])
    # end

    # def set_post
    #   @post = Post.find(params[:id])
    # end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:Comment_Type, :Comment_Id)
    end
    
    def comment_params2
      params.require(:comment).permit(:Comment_Comment)
    end

end
