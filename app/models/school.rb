# == Schema Information
#
# Table name: schools
#
#  id              :integer          not null, primary key
#  ranking         :integer
#  name            :string(255)
#  city            :string(255)
#  state           :string(255)
#  lat             :decimal(, )
#  lon             :decimal(, )
#  tuition         :string(255)
#  enrollment      :integer
#  accept_rate     :string(255)
#  retention_rate  :string(255)
#  graduation_rate :string(255)
#  group           :string(255)
#  offers_count    :integer
#

class School < ActiveRecord::Base
  attr_accessible #nil

  has_many :offers
  has_many :people, through: :offer
  has_many :users
  
  def self.all_brief
    School.select 'id, name'
  end

  def self.all_count
    School.select('ranking, name, offers_count, city, state')
          .where('offers_count > 0')
          .order('ranking ASC')
  end
end
