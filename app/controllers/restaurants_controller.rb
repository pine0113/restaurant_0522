class RestaurantsController < ApplicationController
 
  def index
     @restaurants = Restaurant.page(params[:page]).per(10) 
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @comment = Comment.new
    
  end


  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :opening_hours, :tel, :address, :description, :image, :category_id)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end
