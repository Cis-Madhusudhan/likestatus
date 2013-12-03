class CreateStatusLikes < ActiveRecord::Migration
  def change
    create_table :status_likes do |t|
      t.references :user
      t.references :user_status

      t.timestamps
    end
    add_index :status_likes, :user_id
    add_index :status_likes, :user_status_id
  end
end
