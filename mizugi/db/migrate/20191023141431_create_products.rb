class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.references :category, foreign_key: true
      t.boolean :live

      t.timestamps
    end
  end
end
