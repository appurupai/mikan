class Public::ContactsController < ApplicationController

    def create
        tmp = Contact.new(contact_params)
        if tmp.save
            flash[:success] = t('flash.contact_success')
            redirect_to :back
        else
            flash[:error] = t('flash.contact_error')
            redirect_to :back
        end
    end

    private

    def contact_params
        params.require(:contact).permit(:name, :mail, :message)
    end
end
