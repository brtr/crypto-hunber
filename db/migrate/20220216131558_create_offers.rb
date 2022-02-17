class CreateOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :offers do |t|
      t.string  :name
      t.string  :desc
      t.string  :contract_address
      t.integer :count
      t.integer :status
      t.decimal :reward

      t.timestamps
    end
  end
end
