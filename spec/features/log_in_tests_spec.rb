#encoding: UTF-8
require 'spec_helper'

describe 'Logging in' do
  subject { page }

  describe 'Log in page' do
    before { visit login_path }
    it { should have_selector 'h1', text: 'Log in' }
    it { should have_title '登录'}
  end
end
