class UserSchoolClass < ApplicationRecord
  belongs_to :user
  belongs_to :school_class
end
