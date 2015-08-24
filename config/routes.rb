Rails.application.routes.draw do
    devise_for :users, :skip => :registration
    devise_scope :user do
        match "/login", :to => "devise/sessions#new", via: :get
        match "/logout", :to => "devise/sessions#destroy", via: :get
        match "/me", :to => "devise/registrations#edit", via: :get
    end
    scope module: "public" do
        root "pages#home"
        get "/about", :to => "pages#about"
        get "/contact", :to => "pages#contact"
        get "/seasons/list", :to => "pages#seasons"
        resources :seasons, only: :show
        resources :contacts, only: :create
    end
    authenticated :user do
        namespace :admin do
            get "/dashboard", :to => "dashboard#index"

            get "/pages/home", :tp => "pages#home"
            get "/pages/about", :tp => "pages#about"
            get "/pages/contact", :tp => "pages#contact"
            get "/pages/seasons", :tp => "pages#seasons"
            resources :pages, :only => [:update]

            resources :seasons

            resources :contacts
        end
    end
end
