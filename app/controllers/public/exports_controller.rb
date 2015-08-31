class Public::ExportsController < ApplicationController
  def out
    if params[:season_id].blank?
      flash[:error] = "Please select a season to export !"
      redirect_to export_path
    else
      @season = Season.find(params[:season_id])
      @items = @season.items
      respond_to do |format|
        format.csv { send_data @items.to_csv }
        format.json
        format.xml
      end
    end
  end
end
