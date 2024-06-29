class CreateLineItems < ActiveRecord::Migration[7.1]
  def change
    create_table :line_items do |t|
      t.integer :quantity
      t.decimal :amount
      t.references :products, null: false, foreign_key: true
      t.references :carts, null: false, foreign_key: true

      t.timestamps
    end
  end
end
