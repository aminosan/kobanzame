class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :design_id
      t.string :name
      t.text :description
      t.integer :price
      t.integer :product_status
      t.boolean :active
      t.integer :created_user_id
      t.integer :updated_user_id

      t.timestamps
    end
  end
end