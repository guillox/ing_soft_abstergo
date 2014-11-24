class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :reactive]
  before_filter :require_login, only: [:index]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
		@user.admin = false
		@user.activo = true
    if @user.save
     redirect_to(:users, notice: 'User was succesfully created!')
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.activo = false
		@user.save
		if current_user.activo == false
			logout
		end
		redirect_to(:users, notice: 'User was succesfully deleted!')
    # respond_to do |format|
    #  format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    #  format.json { head :no_content }
    #end
  end

  def reactive
    @user.activo = true
    @user.save
    redirect_to(:users, notice: 'User was succesfully re-activated!')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary Internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :last_name, :username, :email, :email_confirmation, :password, :password_confirmation)
    end
end
