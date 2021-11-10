class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :address
      t.string :postal_code
      t.string :names
      t.integer :pastage
      t.integer :total_payment
      t.integer :payment_method
      t.integer :sattus

      t.timestamps
    end
  end
end
