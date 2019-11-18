class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.references :order,     foreign_key: true
      t.references :product,   foreign_key: true
      t.integer :quantity
      t.datetime :date

      t.timestamps
    end
  end
end
