FactoryBot.define do
  factory :challenge do
    title  {"Mystring"}
    description  {"MyString"}
    start_date {"2021/02/03" }
    end_date {"2022/02/02"}
    active {false }
    goal {200 }
  end
end
