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

class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation

  before_save do |user|
    user.email.downcase!
  end

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  has_one :person
end
