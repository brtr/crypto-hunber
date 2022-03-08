class AddCostToRecommendProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :recommend_projects, :cost, :string
  end
end
