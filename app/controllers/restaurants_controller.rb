class RestaurantsController < ApplicationController
 
  def index
     @restaurants = Restaurant.page(params[:page]).per(10) 
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @comment = Comment.new
    
  end
  
  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = Comment.find(params[:id])

    if current_user.admin?
      @comment.destroy
      redirect_to restaurant_path(@restaurant)
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :opening_hours, :tel, :address, :description, :image, :category_id)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end
