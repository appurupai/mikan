class Admin::DashboardController < ApplicationController

before_filter :is_admin?

  def index
    @title = "Dashboard" # html title helper, see application_helper.rb
    @home_page = Page.first # select the home page
    @last_season = Season.last # select the last (added) season
    @seasons = Season.all.count # count the number of seasons
    @items = Item.all.count # count the number of items
    @contacts = Contact.all.count # count the number of contact messages
    begin
      @home_season = @home.season.title # select the title of the home page season
    rescue
      @home_season = "None" # If it doesn't work, set "None" instead
    end
  end
end
