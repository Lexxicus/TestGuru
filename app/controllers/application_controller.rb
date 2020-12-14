class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: %i[new create]
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  private

  def authenticate_user!
    unless current_user
      cookies[:from_url] = request.original_url
      redirect_to login_path, alert: 'Are you a Human? Verify yourself, using email and password'
    end
  end

  def current_user
    @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
