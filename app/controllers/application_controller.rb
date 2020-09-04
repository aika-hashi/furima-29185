class ApplicationController < ActionController::Base

  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:email,:password,:password_confirmation,:firstname, :familyname, :firstname_kana, :familyname_kana, :date,])
      
end
  
private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
   username == 'aika' && password == '1924'
   end
  end




end

