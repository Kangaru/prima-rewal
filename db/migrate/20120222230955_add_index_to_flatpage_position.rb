class AddIndexToFlatpagePosition < ActiveRecord::Migration
  def change
    add_index :flatpages, :position
  end
end
