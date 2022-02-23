class ChangeOffersColumns < ActiveRecord::Migration[6.1]
  def change
    add_column :offers, :logo, :string
    add_column :offers, :website, :string
    remove_column :offers, :contract_address, :string
  end
end
