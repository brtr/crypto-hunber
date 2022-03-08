require 'rails_helper'

RSpec.describe Offer, type: :model do
  let (:offer) { create(:offer) }

  it "has a valid factory" do
    expect(offer).to be_valid
  end

  it { should have_many(:offer_histories) }
end
