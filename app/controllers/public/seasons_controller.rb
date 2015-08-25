class Public::SeasonsController < ApplicationController
    # show a specific season
    def show
        @season = Season.find params[:id] # select a season with a given ID
        @title = @season.title # html title helper, see application_helper.rb
        if params[:order] == "title" # set the order of the items thanks to the parameter given in the url
          @items = @season.items.order("TITLE ASC")
        elsif params[:order] == "airing_from"
          @items = @season.items.order("AIRING_FROM ASC")
        else
          @items = @season.items.order("CREATED_AT DESC")
        end
        @animes = @items.where(category: "show") # select the shows
        @specials = @items.where(category: "special") # select the specials
        @movies = @items.where(category: "movie") # select the movies
    end
end
