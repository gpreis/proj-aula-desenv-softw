class AddKindToPlaces < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :kind, :string
  end
end
