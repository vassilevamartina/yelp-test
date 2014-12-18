class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|

        t.string :name 
        t.string :display_phone 
        t.decimal :rating      
        t.string :display_address
        t.string :yelp_url          
        t.string :yelp_id

      t.timestamps
    end
  end
end
