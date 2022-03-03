class CreateUserPointHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :user_point_histories do |t|
      t.integer :user_point_id
      t.integer :user_id
      t.integer :source
      t.integer :point
      t.text    :memo

      t.timestamps
    end

    add_index :user_point_histories, [:user_point_id, :user_id]
  end
end
