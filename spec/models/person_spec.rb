# == Schema Information
#
# Table name: people
#
#  id   :integer          not null, primary key
#  name :string(255)
#

require 'spec_helper'

describe Person do
  let (:person) { FactoryGirl.create :person }
  let (:school) { School.first }
  let (:offer) { person.offers.build school_id: school.id }

  subject { person }

  describe "Attributes" do
    it { should respond_to :name }
    it { should respond_to :offers }
    it { should respond_to :schools }
  end

  describe "Person should have the offer" do
    its(:offers) { should include offer }
  end

  describe "Person should have the school" do
    its(:schools) { should include school }
  end
end
