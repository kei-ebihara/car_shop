module CarsHelper
  def show_car_image(car)
   if car.image.attached?
     image_tag car.image.variant(resize: "300x300"), class: "img-thumbnail"
   else
     image_tag "no_image.png", class: "img-thumbnail"
   end
  end
end
