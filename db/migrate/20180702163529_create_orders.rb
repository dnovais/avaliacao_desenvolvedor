class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :person, index: true
      t.string :description
      t.decimal :unity_price
      t.integer :quantity
      t.references :supplier, index: true

      t.timestamps
    end
  end
end
