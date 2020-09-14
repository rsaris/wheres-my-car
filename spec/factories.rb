FactoryBot.define do
  factory :car_location do
    
  end

  sequence :email do |n|
    "user+#{n}@bobsaris.com"
  end

  sequence :uid do |n|
    "#{n}"
  end
end
