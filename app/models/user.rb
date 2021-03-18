class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 6 }

  has_many :school_classes
  has_many :activities
  has_many :device_tokens

  has_many :user_school_classes
  has_many :joined_classes, through: :user_school_classes, source: :school_class
end
