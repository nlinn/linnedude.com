class PostsController < ApplicationController

  before_action :require_login

  def index
    @posts = Post.all.order(updated_at: :desc)
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    render :edit
  end

  def edit
    @post = Post.find_by_slug(params[:id])
    render :edit
  end

  def update
    @post = Post.find_by_slug(params[:id])
    @post.update!(post_params)
    render :edit
  end

  def destroy
    @post = Post.find_by_slug(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :design, :published, :published_at, images: [])
  end
end
