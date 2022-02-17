class Offer < ApplicationRecord
  has_many :offer_histories

  enum status: [:avaliable, :disable]
end
