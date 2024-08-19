class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.string :currency
      t.string :status

      t.timestamps
    end
  end
end
