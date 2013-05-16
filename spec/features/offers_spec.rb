# encoding: UTF-8
require 'spec_helper'

describe 'Offers' do
  subject { page }

  describe 'Add record' do
    before { visit new_offer_path }

    let(:submit) { '提交' }

    describe 'with empty information' do
      it 'should not add an offer' do
        expect { click_button submit }.not_to change Offer, :count
      end
    end

    describe 'with no person information' do
      # before { find('.select2-match').click }
      it 'should not add an offer' do
        should have_selector '.select2-container'
        # expect { click_button submit }.not_to change Offer, :count
      end
    end

    describe 'with no school information' do
      before { fill_in 'offer_person', with: 'Test' }
      it 'should not add an offer' do
        expect { click_button submit }.not_to change Offer, :count
      end
    end

    describe 'with sufficient information' do
      before { fill_in 'offer_person', with: 'Test' }
      before { select 'Harvard', from: 'offer_school' }
      it 'should add an offer' do
        expect { click_button submit }.to change(Offer, :count).by 1
      end
    end

    describe 'with multiple entries' do
      before { fill_in 'offer_person', with: 'Test' }
      before { select 'Harvard', from: 'offer_school' }
      before { select 'Yale', from: 'offer_school' }
      before { select 'Princeton', from: 'offer_school' }
      it 'should add 3 offers' do
        expect { click_button submit }.to change(Offer, :count).by 3
      end
    end
    
  end
end
