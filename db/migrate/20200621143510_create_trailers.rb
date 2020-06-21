class CreateTrailers < ActiveRecord::Migration[6.0]
  def change
    create_table :trailers do |t|
      t.string :name
      t.decimal :length
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
