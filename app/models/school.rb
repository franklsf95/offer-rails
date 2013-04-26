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
#

class School < ActiveRecord::Base
  attr_accessible :ranking, :name, :city, :state, :lat, :lon, :tuition,
      :enrollment, :accept_rate, :retention_rate, :graduation_rate, :type
  
  def self.list
    School.all select: 'id, name'
  end
end
