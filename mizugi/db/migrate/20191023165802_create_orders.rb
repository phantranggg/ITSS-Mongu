class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user,     foreign_key: true
      t.datetime :date
      t.string :ship_name
      t.text :ship_address
      t.boolean :shipped

      t.timestamps
    end
  end
end
