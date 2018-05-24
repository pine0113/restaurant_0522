class RestaurantsController < ApplicationController
 
  def index
     @restaurants = Restaurant.page(params[:page]).per(10) 
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @comment = Comment.new
    
  end
  
  def feeds
    @recent_restaurants = Restaurant.order(created_at: :desc).limit(10)
    @recent_comments = Comment.order(created_at: :desc).limit(10)
  end

  def dashboard
    @restaurant = Restaurant.find(params[:id])
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :opening_hours, :tel, :address, :description, :image, :category_id)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end
