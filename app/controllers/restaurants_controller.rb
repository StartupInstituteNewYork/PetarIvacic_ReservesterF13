class RestaurantsController < ApplicationController
	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end
	
	def create
		@restaurant = current_owner.restaurants.build()
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
		if @restaurant.update(params[:post].permit(:name, :description, :image))
			redirect_to @restaurant
	end

	def destroy
	end


private
  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :image)
  end
end
