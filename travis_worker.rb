class Worker
  include Sidekiq::Worker
  include Sidekiq::RetryMonitoringMiddleware::MonitoredWorker
  sidekiq_options retry: 10
  sidekiq_retries_exhausted { |msg| flag_device_as_in_error!(msg['args'][0]) }

  def perform
  
  end

  def threshold_retry_count_for_warn
    5
  end

  def warn(jid, param)

  end

  def self.flag_device_as_in_error!(device_id)
    Device.find(device_id).flag_as_error!
  end
end
