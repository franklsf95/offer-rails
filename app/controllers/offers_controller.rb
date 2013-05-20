# encoding: UTF-8
class OffersController < ApplicationController
  def new
    @offer = Offer.new
    @schools = School.all_brief
  end

  def create
    person = Person.find_or_create_by_name params[:offer][:person]
    if person.id.nil?
      flash[:error] = '添加失败：请输入姓名。'
      redirect_to new_offer_path
      return
    end
    cnt = 0
    params[:offer][:school].each do |s|
      next if s.empty?
      @offer = Offer.new person_id: person.id, school_id: s
      if not @offer.save
        flash[:error] = '添加失败：' + @offer.errors.full_messages.to_sentence
        redirect_to offers_path
        return
      end
      cnt += 1
    end
    flash[:success] = "成功添加了 #{cnt} 条记录！"
    redirect_to offers_path
  end

  def index
    @offers = School.all_count
    respond_to do |format|
      format.html
      format.csv { render csv: @offers }
      format.json { render json: @offers }
    end
  end

  # GET /offers/exist?person=&school=
  def exist
    person = Person.find_by_name params[:person]
    if person.nil? or person.offers.find_by_school_id(params[:school]).nil?
      render text: 1
    else
      render text: 0
    end
  end
end
