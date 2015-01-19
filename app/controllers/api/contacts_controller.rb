class Api::ContactsController < ApplicationController
  def create
    contact = Contact.new(params[:contact])
    contact.client = Client.find(params[:contact][:client_id])
    if contact.save!
      render json: contact, status: :created
    else 
      render json: contact.errors, status: :unprocessable_entity
    end
  end
end