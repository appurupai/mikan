class Public::SeasonsController < ApplicationController
    def show
        @season = Season.find params[:id]
        @title = @season.title
        if params[:order] == "title"
          @items = @season.items.order("TITLE ASC")
        elsif params[:order] == "airing_from"
          @items = @season.items.order("AIRING_FROM ASC")
        else
          @items = @season.items.order("CREATED_AT DESC")
        end
        @animes = @items.where(category: "show")
        @specials = @items.where(category: "special")
        @movies = @items.where(category: "movie")
    end
end
