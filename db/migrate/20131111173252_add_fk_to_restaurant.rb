class AddFkToRestaurant < ActiveRecord::Migration
  def change
  	add_reference :addresses, :restaurant
  	remove_reference :restaurants, :address
  end
end
