class Api::FollowUpsController < ApplicationController
  
  def create
    followUp = FollowUp.new(params[:follow_up])
    if followUp.save!
      render json: followUp, status: :created
    else
      render json: followUp.errors, status: :unprocessable_entity
    end
  end
end