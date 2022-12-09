Sentry.init do |config|
  config.dsn = 'https://examplePublicKey@o0.ingest.sentry.io/0'
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]

  config.traces_sampler = lambda do |context|
    true
  end
end