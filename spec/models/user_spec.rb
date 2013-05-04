# == Schema Information
#
# Table name: users
#
#  id                    :integer          not null, primary key
#  email                 :string(255)
#  password              :string(255)
#  password_confirmation :string(255)
#  password_digest       :string(255)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require 'spec_helper'

describe User do
  before do
    @user = User.new email: 'foobar@example.com', password: 'foobar', password_confirmation: 'foobar'
    print @user
  end
  subject { @user }

  describe 'User should respond_to attr_accessors' do
    it { should respond_to :email }
    it { should respond_to :person }
    it { should respond_to :password }
    it { should respond_to :password_confirmation }
    it { should respond_to :password_digest }
    it { should be_valid }
  end

  describe 'With invalid emails' do
    it "should_not be_valid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |e|
        @user.email = e
        @user.should_not be_valid
      end
    end
  end

  describe 'With valid emails' do
    it "should be_valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |e|
        @user.email = e
        @user.should be_valid
      end
    end
  end
  
  describe "With duplicate email addresses" do
    before { @user.save }
    it "should be_false" do
      u2 = @user.dup
      u2.save.should be_false
    end

    it "should be_false" do
      u2 = @user.dup
      u2.email.upcase!
      u2.save.should be_false
    end
  end

  describe 'With invalid passwords' do
    it "should_not do with empty passwords" do
      @user.password = @user.password_confirmation = ''
      @user.should_not be_valid
    end
    
    it "should_not do with mismatch passwords" do
      @user.password_confirmation = 'mismatch'
      @user.should_not be_valid
    end
    
    it "should_not do with nil password_confirmation" do
      @user.password_confirmation = nil
      @user.should_not be_valid
    end
    
    it "should_not do with password < 6 chars" do
      @user.password = @user.password_confirmation = 'short'
      @user.should_not be_valid
    end
  end

  describe 'During authentiation...' do
    before { @user.save }
    let(:the_user) { User.find_by_email @user.email }
    it "should authentiate with correct password" do
      should == the_user.authenticate(@user.password)
    end
    it "should_not authentiate with wrong password" do
      should_not == the_user.authenticate('wrong')
    end
  end


end
