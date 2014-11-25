class UserSessionsController < ApplicationController
<<<<<<< HEAD
  skip_before_filter :require_login, except: [:destroy]
=======
  skip_before_filter :require_login, except: [:destroy], except: [:auctions]
>>>>>>> aa2e427d3cadd1cba61c18bcb9f6ca53f141b9bb

  def new
  	@user = User.new
  end

  def create
		unless User.where(username: params[:username], activo: true).empty?
			if @user = login(params[:username], params[:password], params[:remember_me])
				redirect_to(auctions_path, notice: 'Login sucessful!')
			else
				render action: 'new'
				flash.keep[:alert] = 'Login failed'
			end
		else
			render action: 'new'
			flash.keep[:alert] = 'Usuario no activo, comuniquese con un administrador'
		end
  end

  def destroy
  	logout
  	redirect_to(:users, notice: 'Logged out!')
  end
end
