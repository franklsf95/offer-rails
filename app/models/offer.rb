# == Schema Information
#
# Table name: offers
#
#  id         :integer          not null, primary key
#  person_id  :integer
#  school_id  :integer
#  ip         :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Offer < ActiveRecord::Base
  attr_accessible :person_id, :school_id, :ip

  validates :person_id, presence: true
  validates :school_id, presence: true

  belongs_to :person, counter_cache: true
  belongs_to :school, counter_cache: true
end
