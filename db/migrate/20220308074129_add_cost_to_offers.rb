class AddCostToOffers < ActiveRecord::Migration[6.1]
  def change
    add_column :offers, :cost, :string
  end
end
