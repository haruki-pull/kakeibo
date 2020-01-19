class Income < ApplicationRecord 
    validates :category, presence:true
    validates :price, presence:true
    validates :date, presence:true
    validates :memo, presence:true, length: { maximum: 40 }
end