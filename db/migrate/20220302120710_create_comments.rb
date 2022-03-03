class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :recommend_project_id
      t.integer :user_id
      t.text :content

      t.timestamps
    end

    add_index :comments, :recommend_project_id
    add_index :comments, :user_id
  end
end
