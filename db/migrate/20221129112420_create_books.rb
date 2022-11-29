class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.references :author, null: false, foreign_key: true
      t.date :published_at
      t.text :description
      t.integer :pages

      t.timestamps
    end
  end
end
