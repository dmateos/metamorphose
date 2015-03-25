class EndpointsController < ApplicationController
  before_action :set_endpoint, only: [:show, :edit, :update, :destroy]

  def index
    @endpoints = Endpoint.all
  end

  def show
    respond_to do |format|
      format.html
      format.json 
    end
  end

  def new
    @endpoint = Endpoint.new
  end

  def create
    @endpoint = Endpoint.new(endpoint_params)
    @endpoint.save

    respond_to do |format|
      format.html { redirect_to @endpoint }
      format.json { redirect_to @endpoint }
    end
  end

  def edit
    
  end

  def update
    @endpoint.update(endpoint_params)
    @endpoint.save
    respond_to do |format|
      format.html { redirect_to @endpoint }
      format.json { redirect_to @endpoint }
    end
  end

  def destroy
    @endpoint.destroy
    respond_to do |format|
      format.html { redirect_to endpoints_path }
      format.json { redirect_to endpoints_path }
    end
  end

  def push
    @endpoint = Endpoint.find(params[:id])
    @endpoint.data = params[:data]
    @endpoint.save
    respond_to do |format|
      format.html { redirect_to @endpoint }
      format.json { redirect_to @endpoint } 
    end
  end

  private
  def set_endpoint
    @endpoint = Endpoint.find(params[:id])
  end

  def endpoint_params
    params.require(:endpoint).permit(:flow_id, :data)
  end
end
