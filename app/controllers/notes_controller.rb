class NotesController < ApplicationController

  def index
    @posts = Post.notes.published.order(published_at: :desc)
  end

  def show
    @post = Post.notes.find_by_slug(params[:id])
    render :show
  end

end
