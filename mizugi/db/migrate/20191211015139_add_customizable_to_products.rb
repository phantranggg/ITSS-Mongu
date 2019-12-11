class AddCustomizableToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :customizable, :boolean
  end
end
