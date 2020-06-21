class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :sellable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
