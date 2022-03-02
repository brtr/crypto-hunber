class AddReasonToRecommendProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :recommend_projects, :reason, :text
  end
end
