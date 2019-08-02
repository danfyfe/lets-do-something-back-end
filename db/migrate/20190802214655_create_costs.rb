class CreateCosts < ActiveRecord::Migration[5.2]
  def change
    create_table :costs do |t|
      t.integer :budget_id
      t.integer :user_id
      t.string :title
      t.text :description
      t.float :price
      t.timestamps
    end
  end
end
