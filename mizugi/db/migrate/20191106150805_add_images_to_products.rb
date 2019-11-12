class AddImagesToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :images, :string
  end
end
