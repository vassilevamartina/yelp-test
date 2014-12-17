class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :query
      t.string :picture

      t.timestamps
    end
  end
end
