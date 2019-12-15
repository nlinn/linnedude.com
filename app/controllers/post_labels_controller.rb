class PostLabelsController < ApplicationController

  before_action :require_login

  def create
    post = Post.find(post_label_params[:post_id])
    label = Label.find(post_label_params[:label_id])

    PostLabel.create(post: post, label: label)
    redirect_to edit_post_path(post)
  end

  def destroy
    post_label = PostLabel.find(params[:id])
    post_label.destroy
    redirect_to edit_post_path(post_label.post)
  end

  private

  def post_label_params
    params.require(:post_label).permit(:post_id, :label_id)
  end
end
