class AddLogoToRecommendProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :recommend_projects, :logo, :string
  end
end
