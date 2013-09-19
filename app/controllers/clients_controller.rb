class ClientsController < ApplicationController
  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clients }
    end
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @client = Client.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @client }
    end
  end

  # GET /clients/new
  # GET /clients/new.json
  def new
    @client = Client.new
    # @client.contacts.build
    # @client.meetings.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @client }
      format.js
    end
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
    @sales_reps = SalesRep.all
    @contacts = @client.contacts
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(params[:client])

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render json: @client, status: :created, location: @client }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /clients/1
  # PUT /clients/1.json
  def update

    params[:client][:contact_ids] ||= []
    @client = Client.find(params[:id])

    respond_to do |format|
      if @client.update_attributes(params[:client])
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_url }
      format.json { head :no_content }
    end
  end

  def client_contacts
    client = (params[:id])
    cou = Contact.where(client_id: client)
     @msg = { "contacts" => cou}
     
 
    respond_to do |format|
      format.html
      format.json { render json: @msg }
    end
  end

  def add_contacts
    # create a new Contact and give it the name/last name (to have a specific ID for it).
    # update attributes of the giving client and asgin the newly created contact to it.


    cl = (params[:c_id])
    fn = (params[:contact][:fn])
    ln = (params[:contact][:ln])
    client = Client.find(cl);
    contact = Contact.new(first_name: fn, last_name: ln)
    client.contacts << contact

    @msg = { "client" => client.name , "fn" => fn , "ln" => ln}

    # contact = params[:id][:contact]    
    # client.update_attributes :contacts, client.contacts << contact
    respond_to do |format|
      format.html
      format.json { render json: @msg }
      format.js
    end  
  end

end
