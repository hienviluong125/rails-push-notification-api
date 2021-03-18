# frozen_string_literal: true

class Activity < ApplicationRecord
  validates :name, presence: true
  validates :school_class_id, presence: true

  belongs_to :user
  belongs_to :school_class

  after_create_commit :push_notification

  private

  def push_notification
    # TODO: 'Add to sidekiq queue'
    # PushNotificationWorker.perform_async(self.school_class_id, self.name)
    puts "************** #{self.id} **************"
    puts "Add job to sidekiq queue"
    puts "*******************************"
  end
end
