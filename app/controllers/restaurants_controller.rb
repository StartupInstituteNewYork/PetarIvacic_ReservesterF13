class RestaurantsController < ApplicationController
	before_action :authenticate_owner!, only: [:new, :create, :edit, :update, :destroy]
	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end
	
	def create
		@restaurant = Restaurant.new(params[:restaurant].permit(:name, :description, :image))
		
		if @restaurant.save
			redirect_to @restaurant
		else
			render 'new'
		end

	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])
		if @restaurant.update(params[:restaurant].permit(:name, :description, :image))
			redirect_to @restaurant
		else
		end

	end

	def destroy
	end


private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :image)
  end
end


