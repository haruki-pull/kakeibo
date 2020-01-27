FactoryBot.define do

    factory :income, class: Income do 
        category {"給与"}
        price {1000}
        date {2.years.ago}
        memo {"おいしい"}
  
        trait :new_name do
          name {"YourString"}
        end
           
        trait :invalid_name do
          name {" "}
        end
        
      end
    end