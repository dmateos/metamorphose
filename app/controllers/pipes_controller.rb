class PipesController < ApplicationController
  before_action :set_pipe, only: [:show, :edit, :update, :destroy]

  def index
    @pipes = Pipe.all
  end

  def show
    if @pipe.flows.first.connector_url?
      flow = Plumber::HttpFlow.new(@pipe.flows.first.parameters)
    end

    @data_original = flow.data

    @pipe.transforms.all.each do |t|
      transform = Plumber::TransformRegexpReplace.new #need to look this up....
      transform.transform!(flow, t.parameters)
    end

    if @pipe.pipe_in_xml? && @pipe.pipe_out_json?
      pipe = Plumber::XmlToJsonPipe.new
    else
      pipe = Plumber::DummyPipe.new
    end

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
    @flow = @pipe.flows.first
    @transform = @pipe.transforms.first
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
    params.require(:pipe).permit(:in_type, :out_type)
  end
end
