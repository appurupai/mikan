class Admin::SeasonsController < ApplicationController

  def index
    @seasons = Season.all.order("CREATED_AT DESC") # select all the seasons, from the first added one to the last added one
  end

  def new
    @period = Season.new # create a new season ...
  end

  def create # ... and save it
    tmp = Season.new(season_params)
    if tmp.save # if the season is saved
      redirect_to admin_seasons_path
    else
      redirect_to :back
    end
  end

  def edit
    @season = Season.find(params[:id])# select a season with a given ID
  end

  # update a season
  def update
    tmp = Season.find params[:id] # select a season with a given ID
    if tmp.update_attributes(season_params)  # if it's saved
      redirect_to admin_seasons_path
    else
      redirect_to :back
    end
  end

  def destroy
    Season.destroy params[:id]  # select a season with a given ID
    redirect_to admin_seasons_path
  end
  
  # the following is only available and can only be accessible from this controller (you can't call it from the outside)
  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def season_params
    # The items are created through the season, that's why we have to allow the "items_attributes" (nested form)
    params.require(:season).permit(:title, :notice, :items_attributes => [:id, :title,:image,:description, :airing_from, :hummingbird_url, :official_url, :category, :_destroy])
  end
end
