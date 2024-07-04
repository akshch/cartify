class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :title
      t.text :description
      t.decimal :amount
      t.integer :quantity
      t.integer :status
      t.datetime :purchased_at
      t.references :user, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
