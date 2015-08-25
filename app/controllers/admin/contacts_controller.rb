class Admin::ContactsController < ApplicationController
    def index
        @contacts = Contact.all.order("CREATED_AT DESC") # select all the messages
    end

    # If you want to be able to update a message
    #def update
    #    tmp = Contact.find params[:id]
    #    if tmp.update_attributes(contact_params)
    #        redirect_to admin_contacts_path
    #    else
    #        redirect_to :back
    #    end
    #end

    # Destroy a contact message with a given id
    def destroy
        Contact.destroy params[:id]
        redirect_to admin_contacts_path
    end

    # the following is only available and can only be accessible from this controller (you can't call it from the outside)
    private

    #def contact_params
    #    params.require(:contact).permit(:name, :email, :message)
    #end

end
