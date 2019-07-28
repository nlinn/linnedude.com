class NielsworkshopController < ApplicationController

  def index
    @posts = Post.nielsworkshop.published.order(published_at: :desc)
  end

  def show
    @post = Post.nielsworkshop.find_by_slug(params[:id])
    render :show
  end

  def links
  end

end
