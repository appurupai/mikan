class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
    before_action :set_locale
    layout :layout_by_resource

    def set_locale
        I18n.locale = params[:locale] || I18n.default_locale
    end

    def default_url_options(options = {})
        { locale: I18n.locale }.merge options
    end

    protected

    def layout_by_resource
        if devise_controller?
            "devise"
        elsif params[:controller].split("/").first == "admin"
            "admin"
        else
            "public"
        end
    end
end
