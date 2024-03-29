require 'redcarpet/render_strip'

class PostsController < ApplicationController
  layout "admin"
  before_action :require_login

  def index
    @posts = Post.all.order(published_at: :desc).paginate(page: params[:page])
  end

  def new
    @post = Post.new

    render :new
  end

  def create
    @post = Post.create(post_params)
    redirect_to edit_post_path(@post)
  end

  def edit
    @post = Post.find_by_slug(params[:id])
    render :edit
  end

  def update
    @post = Post.find_by_slug(params[:id])
    if @post.update(post_params)
      if params[:post][:photos]
          params[:post][:photos].each do |photo|
            Photo.create(post: @post, file: photo)
          end
      end
    end
    render :edit
  end

  def destroy
    @post = Post.find_by_slug(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def stats
    @post = Post.find_by_slug(params[:post_id])
    @events = Ahoy::Event.where_event("Post viewed", post_id: @post.id).order(time: :desc).limit(20)
    render :stats
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :design,
      :published, :published_at)
  end
end
