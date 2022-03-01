class CreateUserLikeProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :user_like_projects do |t|
      t.integer :user_id
      t.integer :recommend_project_id

      t.timestamps
    end

    add_index :user_like_projects, [:user_id, :recommend_project_id], unique: true
  end
end
