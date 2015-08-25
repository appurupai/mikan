class ApplicationController < ActionController::Base

    # Prevent CSRF attacks by raising an exception.
    protect_from_forgery with: :exception
    # execute "set_locale"
    before_action :set_locale
    # set the layout thanks to the name given by "layout_by_resource"
    layout :layout_by_resource

    # set the locale thanks to the parameter given in the url. If this parameter is empty, we'll use the default locale.
    def set_locale
        I18n.locale = params[:locale] || I18n.default_locale
    end

    # keep the *locale" parameter (= the language) if we change page
    def default_url_options(options = {})
        { locale: I18n.locale }.merge options
    end

    # the following is only available and can only be accessible from this controller (you can't call it from the outside)
    protected

    # give the layout's name used to render the page
    def layout_by_resource
        if devise_controller? # if we're using the devise controller (authentification, user system)
            "devise"
        elsif params[:controller].split("/").first == "admin" # if we're in the "admin"namespace
            "admin"
        else
            "public"
        end
    end
end
