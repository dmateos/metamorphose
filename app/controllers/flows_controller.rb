class FlowsController < ApplicationController
  before_action :set_flow, only: [ :show, :edit, :update, :destroy ]

  def new
    @pipe = Pipe.find(params[:pipe_id])
    @flow = @pipe.flows.new
  end

  def create
    @pipe = Pipe.find(params[:pipe_id])
    @flow = @pipe.flows.new(flow_params)
    @flow.save
    respond_to do |format|
      format.html { redirect_to edit_pipe_path(@pipe) }
      format.json { redirect_to edit_pipe_path(@pipe) }
    end
  end

  def edit
  end
  
  def update
    @flow.update(flow_params)
    @flow.save
    respond_to do |format|
      format.html { redirect_to edit_pipe_path(@pipe) }
      format.json { redirect_to edit_pipe_path(@pipe) }
    end
  end

  def destroy
    @flow.destroy
    respond_to do |format|
      format.html { redirect_to edit_pipes_path(@pipe) }
      format.json { redirect_to edit_pipes_path(@pipe) }
    end
  end

  private
  def set_flow
    @pipe = Pipe.find(params[:pipe_id])
    @flow = @pipe.flows.find(params[:id])
  end

  def flow_params
    params.require(:flow).permit(:connector_type, :pipe_id, :parameters)
  end
end
