class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_user_path
      flash.notice = "User '#{@user.username}' Saved!"
    else
      render :new
      flash.notice = "User '#{@user.username}'Error: Not Saved!"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to new_user_path
      flash.notice = "User '#{@user.username}' Updated!"
    else
      render :edit
      flash.notice = "User '#{@user.username}'Error: Not Updated!"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
