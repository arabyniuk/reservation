FactoryGirl.define do
  factory :table do
  end

  factory :reservation do
    start_time Time.now
    end_time Time.now + 4.hours
    association :table
  end
end
