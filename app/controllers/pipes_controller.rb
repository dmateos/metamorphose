class PipesController < ApplicationController
  before_action :set_pipe, only: [:show, :edit, :update, :destroy]

  def index
    @pipes = Pipe.all
  end

  def show
    if @pipe.in_url?
      flow = Plumber::HttpFlow.new(@pipe.in_options)
    end

    if @pipe.in_xml? && @pipe.out_json?
      pipe = Plumber::XmlToJsonPipe.new
    elsif @pipe.out_unmod?
      pipe = Plumber::DummyPipe.new
    end

    @data_original = flow.data
    pipe.translate!(flow)
    @data = flow.data
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
    params.require(:pipe).permit(:in, :out, :in_type, :out_type, :in_options)
  end
end
