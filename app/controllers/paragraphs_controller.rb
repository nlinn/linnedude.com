class ParagraphsController < ApplicationController
  layout "admin"
  before_action :require_login

  def create
    @paragraph = Paragraph.create(paragraph_params)
    redirect_to edit_paragraph_path(@paragraph)
  end

  def edit
    @paragraph = Paragraph.find(params[:id])
    render :edit
  end

  def update
    @paragraph = Paragraph.find(params[:id])

    if @paragraph.update(paragraph_params)
      if params[:paragraph][:photos]
          params[:paragraph][:photos].each do |photo|
            @paragraph.photos.create(file: photo)
          end
      end

      redirect_to edit_paragraph_path(@paragraph)
    else
      render :edit
    end
  end

  def destroy
    @paragraph = Paragraph.find(params[:id])
    @paragraph.destroy

    redirect_to edit_post_path(@paragraph.post)
  end

  def paragraph_params
    params.require(:paragraph).permit(:post_id, :headline, :sub_headline, :position, :content)
  end
end
