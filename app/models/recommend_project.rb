class RecommendProject < ApplicationRecord
  belongs_to :user
  has_many :user_like_projects, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_rich_text :desc
  has_one_attached :logo

  acts_as_taggable_on :tags

  before_create :set_status

  enum status: [:submitted, :approved]

  def likes_count
    user_like_projects.size
  end

  def logo_url
    logo.attachment.service_url rescue nil
  end

  def self.custom_sort(params)
    case params
    when "tag"
      order("tags.name asc")
    when "name"
      order(name: :asc)
    else
      order(created_at: :desc)
    end
  end

  private
  def set_status
    self.status = "submitted"
  end
end
