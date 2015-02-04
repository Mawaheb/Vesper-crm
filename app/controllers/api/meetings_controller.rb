class Api::MeetingsController < ApplicationController
  before_filter :fetch_meeting, :except => [:index, :create]

  def index
    render json: Meeting.all
  end

  def create
    # sales_ids   = params[:sales_rep_ids]
    # params.delete :sales_rep_ids
    @meeting    = Meeting.new(params[:meeting])
    # sales_rps   = SalesRep.any_in(id: sales_ids)
    # @meeting.sales_reps << sales_rps
    if @meeting.save!
      render json: @meeting, status: :created
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  def fetch_meeting
    @meeting = Meeting.find(params[:id])
  end
end