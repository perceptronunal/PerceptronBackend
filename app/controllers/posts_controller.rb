class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all

    render json: @posts
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    #destroys every comment of an post before destroys post himself
    #(referencial integrity from rails side)
    @comment = Comment.where(post_id: @post.id)
    @comment.each do |tempcomment|
      tempcomment.destroy
    end

    #destroys every resource of an post before destroys post himself
    #(referencial integrity from rails side)
    @resource = Resource.where(post_id: @post.id)
    @resource.each do |tempresource|
      tempresource.destroy
    end

    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:Post_Title, :Post_Content, :organization_id)
    end
end
