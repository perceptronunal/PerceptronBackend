class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]
  before_action :rol, only: [:create, :update, :destroy]
  before_action :authenticate_login, only: [:create, :update, :destroy]

  # GET /comments
  def index
    commenteable = Pet.find(params[:id])
    comments = commenteable.comments.paginate(page: params[:page], per_page:25)
    #@comments = Comment.paginate(page: params[:page], per_page:25)
    render json: comments, serializar: CommentSerializer
  end

  # GET /comments/1
  def show
    render json: comments, serializar: CommentSerializer
  end

  # POST /comments
  def create
    if @comment.save
      render json: @comment, status: :created, location: @comment, serializar: CommentSerializer
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
   
    if @user.id == @comment[:user_id] 
      if @comment.update(comment_params)
        render json: @comment, serializar: CommentSerializer
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

    def rol
      if !current_login.nil?
        @user = User.find_by(User_Email: current_login[:email])
        @organization = Organization.find_by(Organization_Email: current_login[:email])
      end
    end
end
