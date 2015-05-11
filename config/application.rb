require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TaskManager
  class Application < Rails::Application
    config.action_mailer.delivery_method = :smtp

    config.action_mailer.smtp_settings = {
      address:       "smtp.mandrillapp.com",

      port:          "587",
      domain:        "trackyourtask.herokuapp.com",

      user_name:      ENV["MANDRILL_NAME"],
      password:       ENV["MANDRILL_PASS"],

      authentication: "plain",
      enable_starttls_auto: true
    }
    config.active_record.raise_in_transactional_callbacks = true
  end
end
