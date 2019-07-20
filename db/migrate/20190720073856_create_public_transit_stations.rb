class CreatePublicTransitStations < ActiveRecord::Migration[5.2]
  def change
    create_table :public_transit_stations do |t|
      t.string :dhid
      t.string :dtzid
      t.string :name
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
