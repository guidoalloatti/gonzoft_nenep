class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :travelDestiny
  attribute :travelDate
  attribute :phone
  attribute :text
  attribute :phone
  
  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Consulta de presupuesto (nenep.com.ar)",
      :to => "info@nenep.com.ar",
      :from => "webportal@nenep.com.ar"
    }
  end
end