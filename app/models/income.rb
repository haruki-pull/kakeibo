class Income < ApplicationRecord 
    default_scope -> { order(date: :desc) }
    validates :category, presence:true
    validates :price, presence:true
    validates :date, presence:true
    validates :memo, length: { maximum: 40 }
    
    def self.search(search)
        if search
          Income.where(['content LIKE ?', "%#{search}%"])
        else
          Income.all
        end
      end
end