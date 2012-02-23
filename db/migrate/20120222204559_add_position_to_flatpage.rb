class AddPositionToFlatpage < ActiveRecord::Migration
  def change
    add_column :flatpages, :position, :integer
  end
end
