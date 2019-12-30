class PhotosController < ApplicationController

  before_action :require_login

  def index
    @photos = Photo.all.order(updated_at: :desc).paginate(page: params[:page])
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_path}
      format.json { head :no_content }
    end
  end
end