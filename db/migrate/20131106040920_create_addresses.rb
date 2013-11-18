class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
    	t.string :number
    	t.string :street
    	t.string :zip
    	



      t.timestamps
    end
  end
end
