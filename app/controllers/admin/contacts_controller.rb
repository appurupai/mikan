class Admin::ContactsController < ApplicationController
    def index
        @contacts = Contact.all.order("CREATED_AT DESC")
    end

    #def update
    #    tmp = Contact.find params[:id]
    #    if tmp.update_attributes(contact_params)
    #        redirect_to admin_contacts_path
    #    else
    #        redirect_to :back
    #    end
    #end

    def destroy
        Contact.destroy params[:id]
        redirect_to admin_contacts_path
    end

    private

    #def contact_params
    #    params.require(:contact).permit(:name, :email, :message)
    #end
end
