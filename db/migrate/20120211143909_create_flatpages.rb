class CreateFlatpages < ActiveRecord::Migration
  def up
    create_table :flatpages do |t|
      t.timestamps
    end

    Flatpage.create_translation_table! title: :string, content: :text
  end

  def down
    drop_table :flatpages
    Flatpage.drop_translation_table!
  end
end
