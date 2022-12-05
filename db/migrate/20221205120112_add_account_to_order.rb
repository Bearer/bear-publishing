class AddAccountToOrder < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :payment_account, null: true, foreign_key: true
  end
end
