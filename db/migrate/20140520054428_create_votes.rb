class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :category
      t.integer :micropost_id
      t.integer :user_id

      t.timestamps
    end
    add_index :votes, :user_id 
    add_index :votes, :micropost_id
  end
end
