class Api::V1::RegistrationsController < ApplicationController
  before_filter :ensure_params_exist
  respond_to :json

  def create
    resource = User.new_with_session(params[:user], session)
    resource.first_name = params[:user][:first_name]
    resource.last_name = params[:user][:last_name]
    resource.gender = params[:user][:gender]
    resource.dob = params[:user][:date_of_birth]
    if resource.save!
      if resource.active_for_authentication?
        sign_in("user", resource)
        resource.reset_authentication_token!
        render :json=> {:success=>true, :auth_token=>resource.authentication_token} 
      else
        invalid_sign_up_attempt
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  protected
  def ensure_params_exist
    return unless params[:user].blank?
    render :json=>{:success=>false, :message=>"missing user parameter"}, :status=>422
  end

  def invalid_sign_up_attempt
    #warden.custom_failure!
    render :json=> {:success=>false, :message=>"Error with your sign up"}, :status=>401
  end

  def inactive_reason(resource)
    reason = resource.inactive_message.to_s
    I18n.t("devise.registrations.reasons.#{reason}", :default => reason)
  end

end
