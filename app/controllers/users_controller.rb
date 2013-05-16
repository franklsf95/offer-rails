#encoding: UTF-8
class UsersController < ApplicationController
  def new
    pid = params[:person_id]
    if pid.nil?
      flash[:error] = '请先选择一个同学身份，再进行注册。'
      redirect_to prepare_users_path
    else
      @person = Person.find pid
      if !@person.nil?
        flash[:error] = "#{@person.name} 已经领取并注册了账户！请重试。"
        redirect_to prepare_users_path
      else
        @user = User.new name: @person.name, person_id: pid
      end
    end
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

  # Claim a person before signing up
  def prepare
  end
  
  def show
    @user = User.find params[:id]
  end
end
