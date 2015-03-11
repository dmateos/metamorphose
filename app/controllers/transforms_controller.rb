class TransformsController < ApplicationController
  before_action :set_transform, only: [ :show, :edit, :update, :destroy ]

  def new
    @pipe = Pipe.find(params[:pipe_id])
    @transform = @pipe.transforms.new
  end

  def create
    @pipe = Pipe.find(params[:pipe_id])
    @transform = @pipe.transforms.new(transform_params)
    @transform.save
    respond_to do |format|
      format.html { redirect_to edit_pipe_path(@pipe) }
      format.json { redirect_to edit_pipe_path(@pipe) }
    end
  end

  def edit
  
  end

  def update
    @transform.update(transform_params)
    @transform.save
    respond_to do |format|
      format.html { redirect_to edit_pipe_path(@pipe) }
      format.json { redirect_to edit_pipe_path(@pipe) }
    end
  end

  def destroy
    @transform.destroy
    respond_to do |format|
      format.html { redirect_to edit_pipe_path(@pipe) }
      format.json { redirect_to edit_pipe_path(@pipe) }
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
