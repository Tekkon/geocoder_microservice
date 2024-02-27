require 'ougai'

logdev =
  if Application.environment == :production
    STDOUT
  else
    Application.root.concat('/', Settings.logger.path)
  end

logger = Ougai::Logger.new(
  logdev,
  level: Settings.logger.level
)

logger.before_log = lambda do |data|
  data[:service] = { name: Settings.app.name }
  data[:request_id] ||= Thread.current[:request_id]
end

Application.logger = logger
