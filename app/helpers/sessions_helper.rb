require 'base64'

module SessionsHelper
  def sign_in(user)
    cookies[:remember_token] = {
      value:   Base64.encode64(user.email),
      expires: 2.weeks.from_now
    }
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def is_super?
    signed_in? and current_user.superuser?
  end

  def is_ob?
    signed_in? and current_user.observer?
  end

  def sign_out
    self.current_user = nil
    cookies.delete :remember_token
  end

  def current_user
    c_email = cookies[:remember_token] || ''
    @current_user ||= User.find_by_email Base64.decode64 c_email
  end

  def current_user=(user)
    @current_user = user
  end
end
