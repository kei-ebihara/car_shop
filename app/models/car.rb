class Car < ApplicationRecord
  belongs_to :genre
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews
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

  scope :find_newest_cars, -> (p) { page(p).per(4).order(publish_date: :desc) }

  before_save do
    self.image = new_image if new_image
  end
end
