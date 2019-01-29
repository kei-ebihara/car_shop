class Car < ApplicationRecord
  belongs_to :genre
  has_many :reviews
  has_one_attached :image
  attribute :new_image
  
  validates :name, presence: true, length: { maximum: 70 }
  validates :price, presence: true,
    numericality: { 
      only_integer: true,
      greater_than: 1
    }
  validates :publish_date, presence: true
  validates :description, presence: true, length: { maximum: 2000 }

  before_save do
    self.image = new_image if new_image
  end
end
