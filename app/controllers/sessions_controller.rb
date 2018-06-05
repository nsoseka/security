class SessionsController < ApplicationController
  before_action :require_agent, only: [:destroy]

  def new
    @register = true
    redirect_to home_path if current_agent
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to home_path, notice: "You are signed in enjoy!"
    else
      flash[:error] = "Invalid email or password"
      redirect_to sign_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You have signed out"
  end
end
