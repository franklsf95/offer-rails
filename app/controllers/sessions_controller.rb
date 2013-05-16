#encoding: UTF-8
class SessionsController < ApplicationController
  def create
    user = User.find_by_email params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to request.referer
    else
      flash[:error] = '登录失败：用户名或密码错误。'
      redirect_to request.referer
    end
  end

  def destroy
    sign_out
    redirect_to request.referer
  end
end
