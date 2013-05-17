#encoding: UTF-8
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create params[:user]
    if @user.save
      flash[:success] = "注册成功！欢迎使用 Offers，#{@user.name}！"
      sign_in @user
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find params[:id]
  end
end
