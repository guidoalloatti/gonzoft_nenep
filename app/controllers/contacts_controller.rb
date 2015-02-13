class ContactsController < ApplicationController
  respond_to :json

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      @confirmation = Confirmation.new(params[:contact])
      @confirmation.deliver
      respond_to do |format|
        format.json {
         render :json => {message: 'Thank you for your message. We will contact you soon!', status: 200}
        }
      end
    else
      respond_to do |format|
        format.json {
         render :json => {text: @contact.errors}
        }
      end
      # flash.now[:error] = 'Cannot send message.'
    end
  end

end