class CarsController < ApplicationController
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
   @car = Car.find(params[:id])
 end

 private

 def car_params
   params.require(:car).permit(:name, :price, :publish_date, :description)
 end

end
