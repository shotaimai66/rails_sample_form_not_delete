FactoryBot.define do
  factory :todo_list do
    title { "MyString" }
    detail { "MyText" }
    user { nil }
  end
end
