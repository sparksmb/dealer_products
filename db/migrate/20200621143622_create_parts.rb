class CreateParts < ActiveRecord::Migration[6.0]
  def change
    create_table :parts do |t|
      t.string :name
      t.string :part_no
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
