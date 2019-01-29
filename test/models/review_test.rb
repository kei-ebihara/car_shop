require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  belongs_to :car
  belongs_to :user  
  validates :evaluation, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 500 }
  validates_uniqueness_of :car_id, scope: :user_id
end
