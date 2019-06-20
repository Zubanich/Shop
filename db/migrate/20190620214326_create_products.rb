class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :status_id
      t.decimal :price,  precision: 8, scale: 2
      t.string :photos
      t.string :description

      t.timestamps
    end
  end
end
