class Admin::PagesController < ApplicationController
    def home
        @page = Page.find(1)
    end
    def seasons
        @page = Page.find(2)
    end
    def about
        @page = Page.find(3)
    end
    def contact
        @page = Page.find(4)
    end

    def update
        tmp = Page.find params[:id]      
        if tmp.update_attributes(page_params)
            redirect_to admin_dashboard_path
        else
            redirect_to :back
        end
    end

    private

    def page_params
        params.require(:page).permit(:title, :content, :alert, :season_id)
    end
end
