FactoryGirl.define do
  factory :person do
    name 'Frank Luan'
  end

  factory :user do
    email 'user@example.com'
    password 'foobar'
    password_confirmation 'foobar'
    name 'Foo Bar'
    class_id 11
    alt_email 'foobar@uchicago.edu'
    cell_cn '13312345678'
    cell_us '8008008000'
    person_id 1
  end
end
