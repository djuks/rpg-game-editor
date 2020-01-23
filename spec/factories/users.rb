FactoryBot.define do
  factory :user do
    email { "tester@testdomain.test" }
    username  { "tester" }
    password { "pa$$word" }
  end
end
