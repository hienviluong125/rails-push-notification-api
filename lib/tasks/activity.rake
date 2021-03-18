require 'securerandom'

namespace :activity do
  desc 'Generate random activity'

  task generate: :environment do
    10.times do |i|
      puts "RAKE TASK 1 - #{i} - #{Time.current}"
      activity = User.first.activities.new(name: SecureRandom.hex(10))
      activity.save!
    end
  end

  task generate2: :environment do
    10.times do |i|
      puts "RAKE TASK 2 - #{i} - #{Time.current}"
      activity = User.last.activities.new(name: SecureRandom.hex(10))
      activity.save!
    end
  end
end
