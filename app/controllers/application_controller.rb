class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_action :prepare_unobtrusive_flash

  def require_agent
    redirect_to sign_in_path unless current_agent
  end

  def current_agent
    Agent.find(session[:agent_id]) if session[:agent_id]
    Agent.first
    return false
  end

  helper_method :current_agent
end
