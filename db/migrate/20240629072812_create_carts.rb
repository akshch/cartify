class CreateCarts < ActiveRecord::Migration[7.1]
  def change
    create_table :carts do |t|
      t.integer :quantity
      t.decimal :amount, default: 0.0
      t.string :guest_id
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
