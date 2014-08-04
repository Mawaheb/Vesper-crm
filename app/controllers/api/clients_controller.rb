class Api::ClientsController < ApplicationController
  before_filter :fetch_client, :except => [:index, :create]
  
  def fetch_client
    @client = Client.find(params[:id])
  end

  def index
    render json: Client.all
  end

  def show
    render json: @client
  end

  def update    
    if @client.update_attributes(params[:client])
      head :no_content
    else
      render json: @client.errors, status: :unprocessable_entity
    end 
  end

  def destroy
    if @user.destroy
      head :no_content, status: :ok
    else
      render json: @client.errors, status: :unprocessable_entity
  end
end