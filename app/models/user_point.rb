class UserPoint < ApplicationRecord
  belongs_to :user
  has_many :user_point_histories, dependent: :destroy, autosave: true

  def change_point(num, source)
    self.total_points += num
    self.usable_points += num
    user_point_histories.new(source: source, point: num, user_id: user_id)
    self.save!
  end
end
