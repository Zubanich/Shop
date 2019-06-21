class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :status, default: 0, null: false

      t.timestamps
    end
    add_index :orders, :user_id
  end
end
