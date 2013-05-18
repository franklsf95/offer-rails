require 'spec_helper'

describe UsersController do
  subject { page }

  describe 'User profile page' do
    let(:user) { FactoryGirl.create :user }
    before { visit user_path(user) }

    it { should have_selector 'p', text: user.email }
  end
end
