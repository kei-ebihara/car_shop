class Car < ApplicationRecord
 validates :name, presence: true, length: { maximum: 70 }
 validates :price, presence: true,
   numericality: { 
    only_integer: true,
     greater_than: 1
   }
 validates :publish_date, presence: true
 validates :description, presence: true, length: { maximum: 2000 }
end
