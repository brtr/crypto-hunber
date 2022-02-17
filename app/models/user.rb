class User < ApplicationRecord
  has_many :offer_histories

  validates_uniqueness_of :address

  def fetch_history(offer_id)
    offer_histories.where(offer_id: offer_id).take
  end
end
