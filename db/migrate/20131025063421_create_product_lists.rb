class CreateProductLists < ActiveRecord::Migration
  def change
    create_table :product_lists do |t|
      t.string :name
      t.string :description
      t.integer :user_id

      t.timestamps
    end
  end
end
