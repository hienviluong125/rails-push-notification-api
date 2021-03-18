class SchoolClass < ApplicationRecord
  belongs_to :user
  has_many :activities

  has_many :user_school_classes
  has_many :members, through: :user_school_classes, source: :user
  has_many :member_device_tokens, through: :members, source: :device_tokens

  accepts_nested_attributes_for :user_school_classes
end
