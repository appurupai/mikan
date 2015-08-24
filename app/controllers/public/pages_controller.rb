class Public::PagesController < ApplicationController
  def home
    @page = Page.find(1)
    begin
      @season = @page.season
      @title = @page.season.title
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
      @view = true
    rescue
      @view = false
    end
    @page = Page.find(1)
  end
  def seasons
    @title = t('nav.old_seasons')
    @page = Page.find(2)
    @seasons = Season.all.order("CREATED_AT DESC")
  end
  def about
    @title = t('nav.about')
    @page = Page.find(3)
  end
  def contact
    @title = t('nav.contact')
    @page = Page.find(4)
  end
end
