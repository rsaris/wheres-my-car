FactoryBot.define do
  sequence :email do |n|
    "user+#{n}@bobsaris.com"
  end

  sequence :uid do |n|
    "#{n}"
  end
end
