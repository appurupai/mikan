class Public::ContactsController < ApplicationController

    def create
        tmp = Contact.new(contact_params) # create a new message
        if tmp.save # if it's saved
            flash[:success] = t('flash.contact_success')
            redirect_to :back
        else
            flash[:error] = t('flash.contact_error')
            redirect_to :back
        end
    end

    # the following is only available and can only be accessible from this controller (you can't call it from the outside)
    private

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
        params.require(:contact).permit(:name, :mail, :message)
    end
end
