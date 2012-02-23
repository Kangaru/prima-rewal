class RemoveUniquenessOfFlatpagesTitleIndex < ActiveRecord::Migration
  def up
    remove_index :flatpage_translations, :title
    add_index :flatpage_translations, :title
  end

  def down
    remove_index :flatpage_translations, :title
    add_index :flatpage_translations, :title, unique: true
  end
end
