class AddPositionToPortfols < ActiveRecord::Migration[5.0]
  def change
    add_column :portfols, :position, :integer
  end
end
