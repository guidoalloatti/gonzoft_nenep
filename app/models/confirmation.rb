class Confirmation < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  
  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Nenep: hemos recibido su consulta!",
      :to => "#{email}",
      :from => "info@nenep.com.ar"
    }
  end
end