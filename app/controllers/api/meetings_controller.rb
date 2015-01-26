class Api::MeetingsController < ApplicationController
  before_filter :fetch_meeting, :except => [:index, :create]

  def index
    render json: Meeting.all
  end

  def create
    @meeting = Meeting.new(params[:meeting])
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