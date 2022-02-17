class CreateOfferHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :offer_histories do |t|
      t.integer :offer_id
      t.integer :status
      t.string  :user_address

      t.timestamps
    end

    add_index :offer_histories, [:offer_id, :user_address]
  end
end
