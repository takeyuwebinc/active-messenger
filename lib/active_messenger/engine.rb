module ActiveMessenger
  class Engine < ::Rails::Engine
    isolate_namespace ActiveMessenger

    config.after_initialize do
      ActiveMessenger.decorate_user_class!

      Rails.application.reloader.to_prepare do
        ActiveMessenger.decorate_user_class!
      end
    end
  end
end
