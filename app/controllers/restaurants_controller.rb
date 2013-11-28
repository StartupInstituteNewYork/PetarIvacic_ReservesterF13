class RestaurantsController < ApplicationController
  before_action :authenticate_owner!, only: [:new, :create, :edit, :update, :destroy]
  before_action :confirm_ownership, only: [:edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = current_owner.restaurants.build(restaurant_params)
    if @restaurant.save
      redirect_to root_url, notice: "#{@restaurant.name} was successfully created!"
    else
      render :new
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reservation = @restaurant.reservations.build
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      redirect_to root_url, notice: "#{@restaurant.name} was successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to root_url, alert: "#{@restaurant.name} was successfully deleted!"
  end

private
  
  def restaurant_params
    params.require(:restaurant).permit(:owner_id, :name, :description, :address, :phone_number, :image, :menu)
  end

  def confirm_ownership
    restaurant = Restaurant.find(params[:id])
    if restaurant.owner != current_owner
      redirect_to :show, notice: "You don't own this restaurant!"
    end
  end
end
