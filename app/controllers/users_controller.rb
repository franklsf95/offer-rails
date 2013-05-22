#encoding: UTF-8
class UsersController < ApplicationController
  include UsersHelper
  before_filter :signed_in_user, only: [:index, :offers, :show, :edit, :update]
  before_filter :correct_user  , only: [:edit, :update, :destroy]
  def new
    @user = User.new
  end

  def create
    @user = User.create params[:user]
    if @user.save
      sign_in @user
      redirect_to edit_user_path @user, flash: {success: "注册成功！欢迎使用 Offers，#{@user.name}！"}
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find params[:id]
  end

  def edit
    #@user already defined in correct_user
  end

  def update
    #@user already defined in correct_user
    if @user.update_attributes(params[:user])
      redirect_to @user, flash: {success: '成功更新了个人信息！'}
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    sign_out
    redirect_to root_path, flash: {success: '成功删除了用户！'}
  end

  def index
    @users = []
    User.includes(:school).all.each do |u|
      h = {id: u.id, name: u.name, class: class_from_id(u.class_id), email: u.email}
      if u.school.nil?
        h.merge!({school: ''})
      else
        h.merge!({school: u.school.name, city: u.school.city, state: u.school.state})
      end
      @users << h
    end
    @users.sort_by! { |u| u[:school] }
    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  def map
    respond_to do |format|
      format.html
      format.json do
        @users = []
        User.includes(:school).all.each do |u|
          @users << {id: u.id, name: u.name, school: u.school.name, lon: u.school.lon, lat: u.school.lat}  if not u.school.nil?
        end
        render json: @users
      end
    end
  end

  def offers
    @offers = []
    Offer.includes(:school, person: :user).all.each do |o|
      h = {name: o.person.name, school: o.school.name, ranking: o.school.ranking}
      h.merge!({class: class_from_id(o.person.user.class_id)})  if not o.person.user.nil?
      @offers << h
    end
    @offers.sort_by! { |o| o[:school] }
  end

  private
  def signed_in_user
    redirect_to root_path, flash: {error: '请先登录。'} unless signed_in?
  end

  def correct_user
    @user = User.find params[:id]
    redirect_to @user, flash: {error: '不能修改其他用户的信息。'} unless current_user == @user || current_user.superuser?
  end
end
