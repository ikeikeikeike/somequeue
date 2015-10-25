class EchoJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    Rails.logger.debug(args)
  end
end
