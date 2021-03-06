class Api::SchoolClassesController < ApplicationController
  before_action :authorized, only: [:create]

  def create
    school_class = SchoolClass.new(school_class_params)

    if school_class.save
      render json: { success: true, school_class: school_class }
    else
      render json: { success: false, error: school_class.errors.full_messages }
    end
  end

  private

  def school_class_params
    params
      .require(:school_class)
      .permit(
        :name,
        :user_id,
        :member_ids,
        user_school_classes_attributes: %w[id user_id school_id role _destroy]
      )
  end
end