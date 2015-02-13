class ConfirmationsController < ApplicationController
  respond_to :json

  def create
    puts params
    @confirmation = Confirmation.new(params[:contact])
    @confirmation.request = request
    if @confirmation.deliver
      respond_to do |format|
        format.json {
         render :json => {message: 'Mensaje enviado correctamente', status: 200}
        }
      end
    else
      respond_to do |format|
        format.json {
         render :json => {text: @confirmation.errors}
        }
      end
      # flash.now[:error] = 'Cannot send message.'
    end
  end

end