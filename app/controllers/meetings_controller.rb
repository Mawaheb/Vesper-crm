class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.all  
  end


  # def show
  #   @meeting = Meeting.find(params[:id])
  #   @client  = Client.find_by(id: @meeting.client_id)
  #   # render :edit

  # end


  def new
    @sales_reps = SalesRep.all
    @client = Client.new
    @meeting    = Meeting.new
    @meeting.follow_ups.build
  end


  def create
    sales_ids   = params[:sales_reps_ids]
    sales_rps   = SalesRep.any_in(id: sales_ids)

    contact_ids = params[:contact_ids]
    contacts    = Contact.any_in(id: contact_ids)

    @meeting    = Meeting.new(params[:meeting])
    @meeting.sales_reps << sales_rps  # Assigning Sales_reps to the meeting.
    @meeting.contacts   << contacts
    @client = params[:meeting][:client_id]
    
    if @meeting.save
      redirect_to edit_meeting_path(@meeting) , notice: 'Meeting was successfully created.'
    else
      respond_to do |format|
        format.html { render action: "new" }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
        format.js
      end  
    end
  end


  def edit
    @sales_reps = SalesRep.all
    @meeting = Meeting.find(params[:id])
    @contacts = Contact.where(client_id: @meeting.client_id)
    @client   = Client.find_by(id: @meeting.client_id)
    # @meeting.follow_ups.build

    if @meeting.follow_ups.blank?
      @meeting.follow_ups.build
      @followup_is_empty = true      
    end
    
  end

  def update
    @meeting = Meeting.find(params[:id])

    sales_ids   = params[:sales_reps_ids]
    sales_rps   = SalesRep.any_in(id: sales_ids)
    @meeting.sales_reps = []
    @meeting.sales_reps << sales_rps

    contact_ids = params[:contact_ids]
    contacts    = Contact.any_in(id: contact_ids)
    @meeting.contacts = []
    @meeting.contacts << contacts

    @client = params[:meeting][:client_id]

    if @meeting.follow_ups.blank?
      params[:meeting].delete :follow_ups_attributes
    end

    if @meeting.update_attributes(params[:meeting])
      redirect_to edit_meeting_path(@meeting), notice: 'Meeting was successfully updated.'
   else
      respond_to do |format|
        format.html { render action: "edit" }

      end  
    end  
  end

  def destroy
    Meeting.find(params[:id]).destroy
    redirect_to meetings_url
  end


end
