class CreateReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :replies do |t|
      t.integer :message_id
      t.integer :user_id
      t.text :content
      t.timestamps
    end
  end
end
