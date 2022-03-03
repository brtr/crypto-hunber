class CreateUserPoints < ActiveRecord::Migration[6.1]
  def change
    create_table :user_points do |t|
      t.integer :user_id
      t.integer :total_points, default: 0
      t.integer :usable_points, default: 0

      t.timestamps
    end

    add_index :user_points, :user_id
  end
end
