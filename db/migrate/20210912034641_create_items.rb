class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string :name,            null: false
      t.text :description,       null: false
      t.integer :category_id,    null: false
      t.integer :condition_id,   null: false
      t.integer :carriage_id,    null: false
      t.integer :region_id,      null: false
      t.integer :day_id,         null: false
      t.integer :price,          null: false
      t.references :user,        null: false, foreign_key: true
    end
  end
end
