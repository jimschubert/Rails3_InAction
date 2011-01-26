ActiveSupport::Notifications.subscribe do |name,start,finish,id,payload|
  Rails.logger.debug(["notifications:", name,start,finish,id,payload].join(" "))
end
