class Api::ContactsController < ApplicationController
  before_filter :fetch_contact, :except => [:create]
  def create
    contact = Contact.new(params[:contact])
    contact.client = Client.find(params[:contact][:client_id])
    if contact.save!
      render json: contact, status: :created
    else 
      render json: contact.errors, status: :unprocessable_entity
    end
  end


  def update
    if @contact.update_attributes(params[:contact])
      head :no_content
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end
  

  def destroy
    if @contact.destroy
      head :no_content, status: :ok
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  def fetch_contact
    @contact = Contact.find(params[:id])
  end
end