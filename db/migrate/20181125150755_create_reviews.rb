class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user,  index: true
      t.references :place, index: true
      t.text       :comment
      t.integer    :score

      t.timestamps
    end
  end
end
