class Income < ApplicationRecord 
    validates :category, presence:true
    validates :price, presence:true
    validates :date, presence:true
    validates :memo, presence:true
end