# == Schema Information
#
# Table name: people
#
#  id   :integer          not null, primary key
#  name :string(255)
#

class Person < ActiveRecord::Base
  attr_accessible :name

  has_many :offers, dependent: :destroy
  has_many :schools, through: :offers, dependent: :destroy
end
