FactoryGirl.define do
  factory :person do
    name 'Frank Luan'
  end

  factory :user do
    email 'user@example.com'
    password 'foobar'
    password_confirmation 'foobar'
  end
end
