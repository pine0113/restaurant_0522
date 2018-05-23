class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]

  def index
     @restaurants = Restaurant.page(params[:page]).per(10) 
  end

  def show
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
