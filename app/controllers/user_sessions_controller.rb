class UserSessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]
  # skip_before_filter :require_login, except: [:destroy], except: [:auctions]

  def new
  	@user = User.new
  end

  def create
		if @user = login(params[:username], params[:password], params[:remember_me])
			redirect_to(auctions_path, notice: '¡Has iniciado sesión!')
		elsif User.where(username: params[:username], activo: true).blank?
			flash.keep[:alert] = 'Nombre de usuario o contraseña incorrectos'
      render action: 'new'		  
    else
		  flash.keep[:alert] = 'Usuario no activo, comuniquese con un administrador'
      render action: 'new'
		 end
  end

  def destroy
  	logout
  	redirect_to(:auctions, notice: '¡Has cerrado sesión!')
  end
end