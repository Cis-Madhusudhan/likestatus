class CreateUserStatuses < ActiveRecord::Migration
  def change
    create_table :user_statuses do |t|
      t.string :status
      t.references :user

      t.timestamps
    end
    add_index :user_statuses, :user_id
  end
end
