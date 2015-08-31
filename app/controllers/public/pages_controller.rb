class Public::PagesController < ApplicationController
  def home # root_path
    @page = Page.find(1) # select content
    begin
      @season = @page.season # select the season linked to the home page
      @title = @page.season.title # html title helper, see application_helper.rb
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
      @view = true
    rescue # if something went wrong
      @view = false
    end
  end
  def seasons
    @title = t('nav.old_seasons') # html title helper, see application_helper.rb
    @page = Page.find(2) # select content
    @seasons = Season.all.order("CREATED_AT DESC") # select all the seasons, from the first added one to the last added one
  end
  def about
    @title = t('nav.about') # html title helper, see application_helper.rb
    @page = Page.find(3) # select content
  end
  def contact
    @title = t('nav.contact') # html title helper, see application_helper.rb
    @page = Page.find(4) # select content
  end
  def export
    @title = t('nav.export') # html title helper, see application_helper.rb
    @page = Page.find(5) # select content
    @seasons = Season.all
  end
end
