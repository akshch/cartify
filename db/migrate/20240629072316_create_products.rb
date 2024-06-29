class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.decimal :mrp
      t.decimal :nrp
      t.integer :quantity
      t.integer :status
      t.string :slug

      t.timestamps
    end
  end
end
