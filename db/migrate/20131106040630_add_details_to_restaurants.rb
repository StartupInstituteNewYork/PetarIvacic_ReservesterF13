class AddDetailsToRestaurants < ActiveRecord::Migration
  def change
  	add_column :restaurants, :phone, :string 
  	add_reference :restaurants, :address
  end
end
