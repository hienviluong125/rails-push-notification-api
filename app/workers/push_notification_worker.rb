class PushNotificationWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'notification'

  def perform(school_class_id, activity_name)
    puts '***************************************'
    puts "School class id: #{school_class_id}"
    puts "activity name: #{activity_name}"

    school_class = SchoolClass.find(school_class_id)

    return unless school_class.present?

    return unless school_class.member_device_tokens.present?

    device_tokens = school_class.user.device_tokens.pluck(:token) + school_class.member_device_tokens.pluck(:token)

    puts "Device tokens: #{device_tokens}"
    puts "Activity name: #{activity_name}"
    puts '***************************************\n'

    server_key = ENV['FCM_KEY']
    fcm = FCM.new(server_key)
    options = {
      notification: {
        title: 'New activity!',
        body: activity_name
      }
    }
    fcm.send(device_tokens, options)
  end
end
