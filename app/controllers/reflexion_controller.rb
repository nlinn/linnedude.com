class ReflexionController < ApplicationController

  def index
    @posts = Post.reflexion.published.order(published_at: :desc)
  end

  def show
    @post = Post.reflexion.find_by_slug(params[:id])
    ahoy.track "Post viewed", post_id: @post.id, category: @post.category
    render :show
  end

end
