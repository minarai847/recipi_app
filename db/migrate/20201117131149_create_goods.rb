class CreateGoods < ActiveRecord::Migration[6.0]
  def change
    create_table :goods do |t|
      t.integer :user_id
      t.integer :recipe_id
      t.timestamps
    end
  end
end
