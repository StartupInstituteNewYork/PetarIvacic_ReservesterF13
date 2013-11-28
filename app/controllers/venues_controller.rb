class VenuesController < ApplicationController
	before_action :authenticate_owner!, only: [:new, :create, :edit, :update, :destroy]

	def index
		@venues = Venue.all
	end

	def new
		@venue = Venue.new
	end

	def create
		@venue = current_owner.venues.build(venue_params)
		if @venue.save
			redirect_to root_url, notice: "#{@venue.name} was successfully created!"
		else
			render :new
		end
	end

	def show
		@venue = Venue.find(params[:id])
		#@resrv = @venue.reservations.build
	end

	def edit
		@venue = Venue.find(params[:id])
	end

	def update		
		@venue = Venue.find(params[:id])
		if @venue.update(venue_params)
		  redirect_to root_url, notice: "#{@venue.name} was successfully updated!"
		else
		  render :edit
		end
	end

	def destroy
	  @venue = Venue.find(params[:id])
	  @venue.destroy
	  redirect_to root_url, alert: "#{@venue.name} was successfully deleted!"
	end

	private

		def venue_params
		  params.require(:venue).permit(:owner_id, :name, :description, :address, :phone, :image)
		end

end







