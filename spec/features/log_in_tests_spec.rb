#encoding: UTF-8
require 'spec_helper'

describe 'Logging in' do
  subject { page }

  describe 'Before logging in' do
    before { visit root_path }
    it { should have_selector 'li', text: '登录' }
  end

  describe 'Logging in...' do
    before { visit root_path }
    describe 'With invalid information' do
      before { click_button '登录' }
      it { should have_selector 'li', text: '登录' }
      it { should have_selector 'div.alert.alert-error' }
    end

    describe 'With valid information' do
      let(:user) { FactoryGirl.create :user }
      before do
        fill_in 'session_email',    with: user.email
        fill_in 'session_password', with: user.password
        click_button '登录'
      end

      it { should_not have_selector 'li', text: '登录' }
      it { should have_selector 'li', text: '我的'}

      describe 'Logging out...' do
        before { click_link '登出' }
        it { should have_selector 'li', text: '登录' }
      end
    end

  end
end
