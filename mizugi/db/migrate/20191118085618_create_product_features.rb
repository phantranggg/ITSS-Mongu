class CreateProductFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :product_features do |t|
      t.references :product,   foreign_key: true
      t.string :size
      t.string :color
      t.integer :gender
      t.integer :price
      t.integer :quantity
      
      t.timestamps
    end
  end
end
