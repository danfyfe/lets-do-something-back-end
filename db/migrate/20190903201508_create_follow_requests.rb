class CreateFollowRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :follow_requests do |t|
      t.integer :follower_id
      t.integer :user_id
      t.boolean :accepted
      t.timestamps
    end
  end
end
