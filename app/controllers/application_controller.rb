class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # You can break this up to be a bit more readable. Something like:
  def configure_permitted_parameters
    permitted_devise_keys = [
      :email, :password, :name, :blurb,
      :twitter_username, :youtube_username, :soundcloud_username
    ]
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(permitted_devise_keys) }
  end

end
