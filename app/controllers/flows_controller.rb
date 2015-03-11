class FlowsController < ApplicationController
  before_action :set_flow, only: [ :show, :edit, :update, :destroy ]

  def index
    @pipe = Pipe.find(params[:pipe_id])
    @flows = @pipe.flows.all
  end

  def show
    
  end

  def new
    @pipe = Pipe.find(params[:pipe_id])
    @flow = @pipe.flows.new
  end

  def create
    @pipe = Pipe.find(params[:pipe_id])
    @flow = @pipe.flows.new(flow_params)
    @flow.save
    respond_to do |format|
      format.html { redirect_to pipe_flow_path(@pipe, @flow) }
      format.json { redirect_to pipe_flow_path(@pipe, @flow) }
    end
  end

  def edit
  end
  
  def update
    @flow.update(flow_params)
    @flow.save
    respond_to do |format|
      format.html { redirect_to pipe_flow_path(@pipe, @flow) }
      format.json { redirect_to pipe_flow_path(@pipe, @flow) }
    end
  end

  def destroy
    @flow.destroy
    respond_to do |format|
      format.html { redirect_to pipes_flows_path(@pipe) }
      format.json { redirect_to pipes_flows_path(@pipe) }
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
