class PipesController < ApplicationController
  before_action :set_pipe, only: [:show, :edit, :update, :destroy]

  def index
    @pipes = Pipe.all
  end

  def show

  end

  def new
    @pipe = Pipe.new
  end

  def create
    @pipe = Pipe.new(pipe_params)
    @pipe.save
    respond_to do |format|
      format.html { redirect_to @pipe }
      format.json { redirect_to @pipe }
    end
  end

  def edit

  end

  def update
    @pipe.update(pipe_params)
    @pipe.save
    redirect_to do |format|
      format.html { redirect_to @pipe }
      format.json { redirect_to @pipe }
    end
  end

  def destroy
    @pipe.destroy
    redirect_to do |format|
      format.html { redirect_to pipes_path }
      format.json { redirect_to pipes_path }
    end
  end

  private
  def set_pipe
    @pipe = Pipe.find(params[:id])
  end

  def pipe_params
    params.require(:pipe).permit(:in, :out)
  end
end
