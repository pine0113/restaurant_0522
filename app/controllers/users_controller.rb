class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]


def index
    @users = User.all
end

def show
  @user = User.find(params[:id])
  @commented_restaurants = @user.restaurants.uniq

end

def edit
end

def update
    if @user.id == current_user.id 


      if @user.update(user_params)
        flash[:notice] = "intro was successfully updated"
        redirect_to user_path(@user)
      else
        flash.now[:alert] = "intro was failed to update"
        render :edit
      end
    else
        flash.now[:alert] = "intro was failed to update : run user"
        render :edit  
    end

end


private
  
  def user_params
    params.require(:user).permit(:name, :intro, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end



end
