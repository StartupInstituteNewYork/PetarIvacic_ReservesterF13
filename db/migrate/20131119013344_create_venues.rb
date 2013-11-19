class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
    	t.string :name
    	t.text :description
    	t.string :image
    	t.text :address
    	t.string :phone
    	t.references :owner
    	
      t.timestamps
    end
  end
end
