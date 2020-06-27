class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string  :name
      t.string  :street
      t.integer :number
      t.string  :district
      t.string  :zip_code
      t.string  :city
      t.string  :state
      t.string  :country, default: "Brasil"
      t.decimal :latitude,  precision: 10, scale: 8
      t.decimal :longitude, precision: 10, scale: 8
      t.string  :complement

      t.timestamps
      t.index [:latitude, :longitude]
    end
  end
end
