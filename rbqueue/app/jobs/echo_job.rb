class EchoJob < ActiveJob::Base
  queue_as :default

  def perform(msg, *args)
    Rails.logger.ap(msg)
    Rails.logger.ap(args)
  end
end
