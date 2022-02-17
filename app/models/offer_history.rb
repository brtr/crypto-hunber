class OfferHistory < ApplicationRecord
  belongs_to :offer
  belongs_to :user

  enum status: [:submitted, :taken, :done]

  before_create :generate_status

  private
  def generate_status
    self.status = :submitted
  end
end
