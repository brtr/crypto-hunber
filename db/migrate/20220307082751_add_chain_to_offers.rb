class AddChainToOffers < ActiveRecord::Migration[6.1]
  def change
    add_column :offers, :chain, :string
  end
end
