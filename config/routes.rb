# you can see all the routes using the 'rake routes' command
Rails.application.routes.draw do
    devise_for :users, :skip => :registration # remove the "signup" path
    devise_scope :user do
        match "/login", :to => "devise/sessions#new", via: :get
        match "/logout", :to => "devise/sessions#destroy", via: :get
        match "/me", :to => "devise/registrations#edit", via: :get
    end

    scope module: "public" do
        root "pages#home" # set the root path

        # get "/my/beloved/path", :to => "controller#method"      <= /!\ That's important if you want to understand. The controller method is executed just before rendering the page.
        get "/about", :to => "pages#about"
        get "/contact", :to => "pages#contact"
        get "/seasons/list", :to => "pages#seasons"
        resources :seasons, only: :show
        resources :contacts, only: :create
    end

    # if the user is authenticated
    authenticated :user do
        namespace :admin do
            get "/dashboard", :to => "dashboard#index"
            get "/pages/home", :to => "pages#home"
            get "/pages/about", :to => "pages#about"
            get "/pages/contact", :to => "pages#contact"
            get "/pages/seasons", :to => "pages#seasons"
            resources :pages, :only => [:update]
            resources :seasons # index, show, create, update, delete and everything you need (seasons)
            resources :contacts # index, show, create, update, delete and everything you need (contact messages)
        end
    end
end
