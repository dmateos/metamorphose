class TransformsController < ApplicationController
  before_action :set_transform, only: [ :show, :edit, :update, :destroy ]

  def index
    @transforms = Transform.all
  end

  def show

  end

  def new
    @transform = Transform.new
  end

  def create
    @transform = Transform.new(transform_params)
    @transform.save
    respond_to do |format|
      format.html { redirect_to @transform }
      format.json { redirect_to @transform }
    end
  end

  def edit
  
  end

  def update
    @transform.update(transform_params)
    @transform.save
    respond_to do |format|
      format.html { redirect_to @transform }
      format.json { redirect_to @transform }
    end
  end

  def destroy
    @transform.destroy
    respond_to do |format|
      format.html { redirect_to transforms_path }
      format.json { redirect_to transforms_path }
    end
  end

  private
  def set_transform
    @transform = Transform.where(params[:id])
  end

  def transform_params
    params.require(:transform).permit(:pipe_id, :transform_type, :parameters)
  end
end
