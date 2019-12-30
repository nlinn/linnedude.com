class ReadController < ApplicationController

  def show
    @post = Post.find_by_slug(params[:slug])
    if @post
      show_post     
    else
      @label = Label.is_public.find_by(slug: params[:slug])
      if @label
        show_label
      else
        render file: "#{Rails.root}/public/404.html" , status: 404
      end
    end
  end

  private

  def show_post
    ahoy.track "Post viewed", post_id: @post.id, category: @post.category
    render "/designs/#{@post.design}/show"
  end

  def show_label
    @posts = @label.posts.published.sorted.paginate(page: params[:page])
    @posts_count = @label.posts.published.sorted.size
    @title = @label.name    
    render :index
  end

end
