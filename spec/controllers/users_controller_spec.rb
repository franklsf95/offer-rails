require 'spec_helper'

describe UsersController do
  subject { page }

  describe 'User profile page' do
    let(:user) { FactoryGirl.create :user }
    before { visit user_path(user) }

    it { should have_selector 'p', text: user.email }
  end

  describe 'Preparing for signup' do
    describe 'Redirect with no person info' do
      before { visit new_user_path }
      it { should have_selector 'h1' }
      it { should have_selector '.alert-error' }
    end
  end

  describe 'Signing up' do
    before { visit new_user_path, person_id: 1 }
  end
end
