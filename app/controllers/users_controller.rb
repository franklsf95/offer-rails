#encoding: UTF-8
class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :correct_user  , only: [:edit, :update]
  def new
    @user = User.new
  end

  def create
    @user = User.create params[:user]
    if @user.save
      flash[:success] = "注册成功！欢迎使用 Offers，#{@user.name}！"
      sign_in @user
      redirect_to edit_user_path @user
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find params[:id]
  end

  def edit
    # @user defined in correct_user()
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = '成功更新了个人信息！'
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  # include SessionsHelper
  def signed_in_user
    unless signed_in?
      flash[:error] = '请先登录。'
      redirect_to root_path
    end
  end

  def correct_user
    @user = User.find params[:id]
    unless current_user == @user
      flash[:error] = '不能修改其他用户的信息。'
      redirect_to root_path
    end
  end
end
