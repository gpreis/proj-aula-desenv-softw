class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.references :user, index: true
      t.references :place, index: true
      t.attachment :image
    end
  end
end
