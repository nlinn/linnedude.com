class LabelsController < ApplicationController
  layout "admin"
  before_action :require_login

  def index
    @labels = Label.sorted
    render :index
  end

  def new
    @label = Label.new
    render :new
  end

  def create
    @label = Label.new(label_params)

    if @label.save
      redirect_to labels_path
    else
      render :new
    end
  end

  def edit
    @label = Label.find(params[:id])
    render :edit
  end

  def update
    @label = Label.find(params[:id])
    if @label.update(label_params)
      redirect_to labels_path
    else
      render :edit
    end
  end

  def destroy
    @label = Label.find(params[:id])
    @label.destroy
    redirect_to labels_path
  end

  private

  def label_params
    params.require(:label).permit(:name, :public, :sort, :text_color, :bg_color, :description)
  end
end
