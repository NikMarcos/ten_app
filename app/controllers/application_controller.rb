class ApplicationController < ActionController::Base
  helper_method :current_user
  protect_from_forgery with: :exception

  before_action :set_locale

   def set_locale
     I18n.locale = (session[:locale] || params[:locale] || extract_locale_from_accept_language_header).to_s.downcase.presence || I18n.default_locale
   end

   protected

   def active_access_denied(exception)
     redirect_to root_path, alert: exception.message
   end

  private


    def extract_locale_from_accept_language_header
      request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    end
end
