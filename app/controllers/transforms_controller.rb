class TransformsController < ApplicationController
  before_action :set_transform, only: [ :show, :edit, :update, :destroy ]

  def index
    @pipe = Pipe.find(params[:pipe_id])
    @transforms = @pipe.transforms.all
  end

  def show

  end

  def new
    @pipe = Pipe.find(params[:pipe_id])
    @transform = @pipe.transforms.all
  end

  def create
    @pipe = Pipe.find(params[:pipe_id])
    @transform = @pipe.transforms.new(transform_params)
    @transform.save
    respond_to do |format|
      format.html { redirect_to pipe_transform_path(@pipe, @transform) }
      format.json { redirect_to pipe_transform_path(@pipe, @transform) }
    end
  end

  def edit
  
  end

  def update
    @transform.update(transform_params)
    @transform.save
    respond_to do |format|
      format.html { redirect_to pipe_transform_path(@pipe, @transform) }
      format.json { redirect_to pipe_transform_path(@pipe, @transform) }
    end
  end

  def destroy
    @transform.destroy
    respond_to do |format|
      format.html { redirect_to pipe_transforms_path(@pipe) }
      format.json { redirect_to pipe_transforms_path(@pipe) }
    end
  end

  private
  def set_transform
    @pipe = Pipe.find(params[:pipe_id])
    @transform = @pipe.transforms.find(params[:id])
  end

  def transform_params
    params.require(:transform).permit(:pipe_id, :transform_type, :parameters)
  end
end
