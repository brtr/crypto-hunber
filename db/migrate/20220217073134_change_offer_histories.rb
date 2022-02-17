class ChangeOfferHistories < ActiveRecord::Migration[6.1]
  def change
    remove_column :offer_histories, :user_address, :string
    remove_index :offer_histories, name: "index_offer_histories_on_offer_id_and_user_address"
    add_column :offer_histories, :user_id, :integer
    add_index :offer_histories, [:offer_id, :user_id]
  end
end
