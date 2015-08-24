class Admin::DashboardController < ApplicationController
  def index
    @title = "Dashboard"
    @home = Page.first
    @seasons = Season.all
    @items = Item.all
    @contacts = Contact.all
    begin
      @home_season = @home.season.title
    rescue
      @home_season = "None"
    end
  end
end
