class AddMetaFieldsToFlatpage < ActiveRecord::Migration
  def change
    add_column :flatpage_translations, :meta_title, :string
    add_column :flatpage_translations, :meta_description, :string
    add_column :flatpage_translations, :meta_keywords, :string
  end
end
