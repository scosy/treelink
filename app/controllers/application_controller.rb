require "byebug"

class ApplicationController < ActionController::Base
  private

  def authenticate_user!
    redirect_to root_path, alert: "Vous devez etre connecté pour accéder à cette page." unless user_signed_in?
  end

  def current_user
    Current.user ||= authenticate_user_from_session
  end
  helper_method :current_user

  def authenticate_user_from_session
    User.find_by(id: session[:user_id])
  end

  def user_signed_in?
    current_user.present?
  end
  helper_method :user_signed_in?

  def login(user)
    Current.user = user
    reset_session
    session[:user_id] = user.id
  end

  def logout
    reset_session
    Current.user = nil
  end
end
