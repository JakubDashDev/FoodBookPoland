class CreateContentCreators < ActiveRecord::Migration[7.1]
  def change
    create_table :content_creators do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.jsonb :platforms, null: false, default: {}

      t.index :name, unique: true

      t.timestamps
    end
  end
end
