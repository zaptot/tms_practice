class AddIndexFromToCreatedAtToCurrenciesRates < ActiveRecord::Migration[7.0]
  def change
    add_index :currency_rates, %i[from to created_at]
  end
end
