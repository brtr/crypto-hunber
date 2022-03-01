class RecommendProject < ApplicationRecord
  belongs_to :user
  has_many :user_like_projects, dependent: :destroy

  def likes_count
    user_like_projects.size
  end
end
