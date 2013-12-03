class CreateUserLists < ActiveRecord::Migration
  def change
    create_table :user_lists do |t|
    	t.string :mapping_type
			t.integer :mapping_id

      t.timestamps
    end
  end
end
