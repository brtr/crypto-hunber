class RecommendProject < ApplicationRecord
  belongs_to :user
  has_many :user_like_projects, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_rich_text :desc
  has_one_attached :logo

  acts_as_taggable_on :tags

  def likes_count
    user_like_projects.size
  end

  def logo_url
    logo.attachment.service_url rescue nil
  end
end
