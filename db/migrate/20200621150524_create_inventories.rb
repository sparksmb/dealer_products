class CreateInventories < ActiveRecord::Migration[6.0]
  def change
    create_table :inventories do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :sellable, polymorphic: true, null: false
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
