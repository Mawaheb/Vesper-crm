class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.all
  end


  def show
    @meeting = Meeting.find(params[:id])
  end


  def new
    @sales_reps = SalesRep.all
    @meeting    = Meeting.new
  end


  def create
    sales_ids   = params[:sales_reps_ids]
    sales_rps   = SalesRep.any_in(id: sales_ids)
    @meeting    = Meeting.new(params[:meeting])
    @meeting.sales_reps << sales_rps
    if @meeting.save
      redirect_to @meeting , notice: 'Meeting was successfully created.'
    else
      render action: "new"
    end
  end


  def edit
    @sales_reps = SalesRep.all
    @meeting = Meeting.find(params[:id])
  end

  def update
    # dee
    @meeting = Meeting.find(params[:id])
    sales_ids   = params[:sales_reps_ids]
    sales_rps   = SalesRep.any_in(id: sales_ids)
    # @meeting    = Meeting.new(params[:meeting])
    @meeting.sales_reps = []
    @meeting.sales_reps << sales_rps
    if @meeting.update_attributes(params[:meeting])
      redirect_to @meeting, notice: 'Meeting was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    Meeting.find(params[:id]).destroy
    redirect_to meetings_url
  end
end