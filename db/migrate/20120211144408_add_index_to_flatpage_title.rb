class AddIndexToFlatpageTitle < ActiveRecord::Migration
  def change
    add_index :flatpage_translations, :title, unique: true
  end
end
