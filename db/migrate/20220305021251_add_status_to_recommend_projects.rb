class AddStatusToRecommendProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :recommend_projects, :status, :integer
  end
end
