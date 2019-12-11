class AddCustomizableToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :customizable, :boolean
    add_column :products, :custom_logo, :string
  end
end
