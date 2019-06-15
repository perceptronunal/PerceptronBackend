class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]
  before_action :authenticate_user, only: [:create, :update, :destroy]
  before_action :authenticate_organization, only: [:create, :update, :destroy], unless: -> { !current_user.nil? }

  # GET /comments
  def index
    commenteable = Pet.find(params[:id])
    comments = commenteable.comments.paginate(page: params[:page], per_page:25)
    #@comments = Comment.paginate(page: params[:page], per_page:25)
    render json: comments
  end

  # GET /comments/1
  def show
    render json: @comment
  end

  # POST /comments
  def create

    type = comment_params_poly[:Commenteable_Type]
    id = comment_params_poly[:Commenteable_Id]

    case type
    when "post"
      @post = Post.find(id)
      @comment = @post.comments.new(comment_params)
    when "pet"
      @pet = Pet.find(id)
      @comment = @pet.comments.new(comment_params)
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
   
    if current_user[:id] == @comment[:user_id] 
      if @comment.update(comment_params)
        render json: @comment
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    else
      puts "Unauthorized access"
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    ###create visible fields. ### 
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:Comment_Comment)
    end

    def comment_params_poly
      params.require(:comment).permit(:Commenteable_Type, :Commenteable_Id)
    end
end
