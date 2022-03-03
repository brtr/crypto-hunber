class UserPointHistory < ApplicationRecord
  belongs_to :user
  belongs_to :user_point

  enum source: [:like, :dislike]
end
