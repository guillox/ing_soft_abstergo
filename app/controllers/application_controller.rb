class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied, with: :access_denied

  # before_filter :require_login

  private

  def not_authenticated
  	redirect_to login_path, alert: 'Por favor, inicia sesión primero'
  end

  def access_denied
  	redirect_to root_path, alert: 'No tenés permisos para acceder.'
  end

end
