module ActiveMessenger
  class ApplicationController < ActionController::Base
    before_action :authorize_user!

    helper_method :current_user
    def current_user
      warden.authenticate(scope: mapping.to_sym)
    end

    helper_method :user_logged_in?
    def user_logged_in?
      !! current_user
    end

    private

    def warden
      request.env['warden']
    end

    def mapping
      ActiveMessenger.user_class_name.underscore
    end

    def authorize_user!
      return if user_logged_in?

      redirect_to ActiveMessenger.root_url, notice: I18n.t('authorization_required')
    end
  end
end
