class ApplicationController < ActionController::Base
  private
  def current_user
    @_current_user ||= session[:current_user_id] && User.find_by(id: session[:current_user_id])
  end

  def signed_in?
    current_user
  end

  helper_method :signed_in?, :current_user
end
