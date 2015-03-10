class FlowsController < ApplicationController
  before_action :set_flow, only: [ :show, :edit, :update, :destroy ]

  def index
    @flows = Flow.all
  end

  def show
    
  end

  def new
    @flow = Flow.new
  end

  def create
    @flow = Flow.new(flow_params)
    @flow.save
    respond_to do |format|
      format.html { redirect_to @flow }
      format.json { redirect_to @flow }
    end
  end

  def edit
  end
  
  def update
    @flow.update(flow_params)
    @flow.save
    respond_to do |format|
      format.html { redirect_to @flow }
      format.json { redirect_to @flow }
    end
  end

  def destroy
    @flow.destroy
    respond_to do |format|
      format.html { redirect_to flows_path }
      format.json { redirect_to flows_path }
    end
  end

  private
  def set_flow
    @flow = Flow.find(params[:id])
  end

  def flow_params
    params.require(:flow).permit(:connector_type, :pipe_id, :parameters)
  end
end
