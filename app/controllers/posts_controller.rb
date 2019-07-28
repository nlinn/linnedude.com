class PostsController < ApplicationController

  before_action :require_login

  def index
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render :edit
    end
  end

  def show
    @post = Post.find_by_slug(params[:id])
    redirect_to "/#{@post.category}/#{params[:id]}"
  end

  def edit
    @post = Post.find_by_slug(params[:id])
    render :edit
  end

  def update
    @post = Post.find_by_slug(params[:id])
    @post.update!(post_params)
    redirect_to @post
  end

  def destroy
    @post = Post.find_by_slug(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category, :published, :published_at, images: [])
  end
end
