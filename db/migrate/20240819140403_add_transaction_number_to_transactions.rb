class AddTransactionNumberToTransactions < ActiveRecord::Migration[7.1]
  def change
    add_column :transactions, :transaction_number, :string
  end
end
