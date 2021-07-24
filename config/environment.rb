require_relative "application"

Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.active_support.deprecation = :log
  config.active_support.disallowed_deprecation = :raise
  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
end

Rails.application.initialize!
