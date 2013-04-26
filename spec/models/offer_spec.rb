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

require 'spec_helper'

describe Offer do
  let (:person) { FactoryGirl.create :person }
  let (:school) { School.first }
  let (:offer) { person.offers.build school_id: school.id }

  subject { offer }
  it { should be_valid }

  describe "Validity test" do
    before { offer.person_id = nil }
    it { should_not be_valid }
    before { offer.school_id = nil }
    it { should_not be_valid }
  end
end
