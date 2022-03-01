class CreateRecommendProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :recommend_projects do |t|
      t.integer :user_id
      t.string  :name
      t.string  :website
      t.text    :desc

      t.timestamps
    end
  end
end
