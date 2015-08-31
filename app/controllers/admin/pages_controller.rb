class Admin::PagesController < ApplicationController
    def home
        @page = Page.find(1) # select the "home" page content
    end
    def seasons
        @page = Page.find(2) # select the "seasons list" page content
    end
    def about
        @page = Page.find(3) # select the "about us" page content
    end
    def contact
        @page = Page.find(4) # select the "contact us" page content
    end
    def export
        @page = Page.find(5) # select the "contact us" page content
    end
    # update a page
    def update
        tmp = Page.find params[:id] # select a page with a given ID
        if tmp.update_attributes(page_params) # if it's saved
            redirect_to admin_dashboard_path
        else
            redirect_to :back
        end
    end

    # the following is only available and can only be accessible from this controller (you can't call it from the outside)
    private

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
        params.require(:page).permit(:title, :content, :alert, :season_id)
    end
end
