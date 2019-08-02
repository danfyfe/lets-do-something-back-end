class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :event_id
      t.string :title
      t.text :content
      
      t.timestamps
    end
  end
end
