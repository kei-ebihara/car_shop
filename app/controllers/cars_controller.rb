class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  def index
    @cars = Car.all
  end
  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to @car, notice: "車体を登録しました。"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @car.update(car_params)
      redirect_to @car, notice: "車体を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @car.destroy
    redirect_to cars_path, notice: "車体を削除しました。"
  end

  def index
    @cars = Car.all
  end
  
  private

  def car_params
    params.require(:car).permit(:name, :price, :publish_date, :description, :new_image, :genre_id)
  end
  def set_car
    @car = Car.find(params[:id])
  end

end
