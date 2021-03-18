class Api::ActivitiesController < ApplicationController
  before_action :authorized, only: [:create]

  def create
    activity = logged_in_user.activities.new(activity_params)

    if activity.save
      return render json: { success: true, activity: activity }
    else
      return render json: { success: false, error: activity.errors.full_messages }
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :school_class_id)
  end
end