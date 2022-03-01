class UserLikeProject < ApplicationRecord
  belongs_to :user
  belongs_to :recommend_project
end
