class ReviewsController < ApplicationController
  before_action :set_car, only: [:show, :new, :edit]
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  
  def new
    @car = Car.find(params[:car_id])
    @review = Review.new
  end 
  def create
    @review = Review.new(review_params)
    @review.attributes = {
      car_id: params[:car_id],
      user_id: current_user.id
    }
    if @review.save
      redirect_to @review.car, notice: "レビューを更新しました。"
    else
      render :new
    end
  end 

  def show
  end

  def edit
  end  
  def update
    if @review.update(review_params)
      redirect_to @review.car, notice: "レビューを更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to @review.car, notice: "レビューを削除しました。"
  end

  private 
  def review_params
    params.require(:review).permit(:title, :body, :evaluation)
  end

  def set_car
    @car = Car.find(params[:car_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

end
