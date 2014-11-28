class Api::SalesRepsController < ApplicationController
  before_filter :fetch_sr, :except => [:index, :create]

  def fetch_sr
    salesRep = SalesRep.find(params[:id])
  end

  def index
    render json: SalesRep.all
  end

  def show
    render json: salesRep
  end

  def create
    salesRep = SalesRep.new(params[:sales_rep])
    if salesRep.save!
      render json: salesRep, status: :created
    else
      render json: salesRep.errors, status: :unprocessable_entity
    end
  end

  def update
    if salesRep.update_attributes(params[:sales_rep])
      head :no_content
    else
      render json: salesRep.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if salesRep.destroy
      head :no_content, status: :ok
    else
      render json: salesRep.errors, status: :unprocessable_entity
    end
  end

end