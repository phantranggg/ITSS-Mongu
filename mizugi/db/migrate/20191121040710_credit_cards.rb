class CreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.string :digits
      t.integer :month
      t.integer :year

      t.timestamps
    end
  end
end