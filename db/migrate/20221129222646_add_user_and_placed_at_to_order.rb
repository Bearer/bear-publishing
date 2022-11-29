class AddUserAndPlacedAtToOrder < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :user, null: true, foreign_key: true
    add_column :orders, :placed_at, :datetime, null: true
  end
end
