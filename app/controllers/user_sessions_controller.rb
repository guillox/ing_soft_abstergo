class UserSessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]
  # skip_before_filter :require_login, except: [:destroy], except: [:auctions]

  def new
  	@user = User.new
  end

  def create
    if User.where(username: params[:username], active: true).blank?
      flash.keep[:alert] = 'El usuario no existe o no se encuentra activo'
      render action: 'new'
    elsif @user = login(params[:username], params[:password], params[:remember_me])
      redirect_to(auctions_path, notice: '¡Has iniciado sesión!')
    else
      flash.keep[:alert] = 'Nombre de usuario o contraseña incorrectos'
      render action: 'new'  
    end
  end

  def destroy
  	logout
  	redirect_to(:auctions, notice: '¡Has cerrado sesión!')
  end
end