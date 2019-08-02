class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.text :description
      t.string :password_digest
      
      t.timestamps
    end
  end
end
