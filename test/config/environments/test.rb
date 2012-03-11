App::Application.configure do
  config.active_support.deprecation = :stderr
  config.assets.enabled = true
  config.assets.version = '1.0'
  config.secret_token = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
  config.i18n.default_locale = :ru
end
