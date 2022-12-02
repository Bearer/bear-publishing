class CreatePaymentAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_accounts do |t|
      t.references :organization, null: false, foreign_key: true
      t.string :reference_name
      t.text :holder_address
      t.text :bank_address
      t.string :bank_name
      t.string :account_number
      t.string :sort_code
      t.string :holder_name

      t.timestamps
    end
  end
end
