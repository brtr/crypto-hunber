class Offer < ApplicationRecord
  has_many :offer_histories

  enum status: [:avaliable, :disable]

  def display_num
    "#{offer_histories.count} / #{count}"
  end
end
