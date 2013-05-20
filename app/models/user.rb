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
#  name                  :string(255)
#  class_id              :integer
#  alt_email             :string(255)
#  cell_cn               :string(255)
#  cell_us               :string(255)
#  person_id             :integer
#  school_id             :integer
#  skype                 :string(255)
#  facebook              :string(255)
#  notes                 :text
#

class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation,
      :name, :class_id, :alt_email, :cell_cn, :cell_us,
      :person_id, :school_id, :skype, :facebook, :notes

  before_save do |user|
    user.email.downcase!
  end

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  validates :name,      presence: true
  validates :person_id, presence: true, uniqueness: true

  validates :alt_email, format: { with: VALID_EMAIL_REGEX }, allow_blank: true
  validates :cell_cn, format: { with: /\d{3} \d{4} \d{4}/ }, allow_blank: true
  validates :cell_us, format: { with: /\(\d{3}\) \d{3}-\d{4}/ }, allow_blank: true

  belongs_to :person
  belongs_to :school
end
