class RecommendProject < ApplicationRecord
  belongs_to :user
  has_many :user_like_projects, dependent: :destroy
  has_rich_text :desc

  acts_as_taggable_on :tags

  def likes_count
    user_like_projects.size
  end
end
