class ReviewsController < ApplicationController
  before_action :set_review, only: :show

  def new
    @book = Car.find(params[:car_id])
    @review = Review.new
  end 
  def create
    @review = Review.new(review_params)
    @review.attributes = {
      car_id: params[:car_id],
      user_id: current_user.id
    }
    if @review.save
      redirect_to @review.car, notice: "レビューを登録しました。"
    else
      render :new
    end
  end 

  def show
  end

  private 
  def review_params
    params.require(:review).permit(:title, :body, :evaluation)
  end

  def set_review
    @review = Review.find(params[:id])
  end

end
