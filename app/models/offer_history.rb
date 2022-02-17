class OfferHistory < ApplicationRecord
  belongs_to :offer

  enum status: [:submitted, :taken, :done]

  before_create :generate_status

  private
  def generate_status
    self.status = :submitted
  end
end
