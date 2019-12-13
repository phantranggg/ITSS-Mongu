class CreateProductCustomLogos < ActiveRecord::Migration[5.2]
  def change
    create_table :product_custom_logos do |t|
      t.integer :user_id
      t.integer :product_id
      t.string :logo_url
      t.timestamps
    end
  end
end
