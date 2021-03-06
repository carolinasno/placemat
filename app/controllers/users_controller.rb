class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @users = User.all
    @user = User.new
  end

  def log_in
  end

  def profile
    authenticate!
  end

  def create
    user = User.create(user_params)
    if user.save
      user.id = session[:user]
      redirect_to log_in_path
    else
      flash[:error] = user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_path
  end

  def destroy
    User.delete(params[:id])
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :permission)
  end

end
