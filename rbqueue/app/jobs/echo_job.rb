class EchoJob < ActiveJob::Base
  queue_as :default

  def perform(msg = "no args")
    Rails.logger.debug(msg)
  end
end
