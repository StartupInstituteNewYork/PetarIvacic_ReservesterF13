class RestaurantsController < ApplicationController
	def index
	end

	def new
	end
	
	def create
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

	def show
	end

	private
  def restaurant_params
    params.require(:restaurant).permit(:name, :description)
  end
end
