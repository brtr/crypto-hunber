class Offer < ApplicationRecord
  has_many :offer_histories

  enum status: [:avaliable, :disable]

  def display_num
    "#{offer_histories.size} / #{count}"
  end
end
