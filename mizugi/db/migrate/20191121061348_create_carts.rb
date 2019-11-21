class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.integer :user_id
      t.integer :product_feature_id
      t.integer :quantity
      t.timestamps
    end

  add_index(:carts, [:user_id, :product_feature_id])
  
  end 
end
