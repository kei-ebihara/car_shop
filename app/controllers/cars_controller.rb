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

 def edit
   @car = Car.find(params[:id])
 end

 def update
   @car = Car.find(params[:id])
   if @car.update(car_params)
     redirect_to @car, notice: "車体を更新しました。"
   else
     render :edit
   end
 end

 def destroy
   @car = Car.find(params[:id])
   @car.destroy
   redirect_to cars_path, notice: "車体を削除しました。"
 end

 def index
   @cars = Car.all
 end


 private

 def car_params
   params.require(:car).permit(:name, :price, :publish_date, :description, :new_image)
 end

end
