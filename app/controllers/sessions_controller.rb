class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:from_url] || tests_path, notice: 'Glad to see you again'
    else
      flash.now[:alert] = 'Are you a Human? Verify yourself, using email and password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'You logged out!'
  end
end
