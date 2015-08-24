class Admin::SeasonsController < ApplicationController
    def index
        @seasons = Season.all.order("CREATED_AT DESC")
    end
    def new
        @period = Season.new
    end
    def create
        tmp = Season.new(season_params)
        if tmp.save
            redirect_to admin_seasons_path
        else
            redirect_to :back
        end
    end

    def edit
        @season = Season.find(params[:id])
    end

    def update
        tmp = Season.find params[:id]
        if tmp.update_attributes(season_params)
            redirect_to admin_seasons_path
        else
            redirect_to :back
        end
    end

    def destroy
        Season.destroy params[:id]
        redirect_to admin_seasons_path
    end

    private

    def season_params
        params.require(:season).permit(:title, :notice, :items_attributes => [:id, :title,:image,:description, :airing_from, :hummingbird_url, :official_url, :category, :_destroy])
    end
end
