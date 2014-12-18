class CreateUserPlaces < ActiveRecord::Migration
  def change
    create_table :user_places do |t|
      t.references :user, index: true
      t.references :place, index: true

      t.timestamps
    end
  end
end
