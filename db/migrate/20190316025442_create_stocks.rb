class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.integer :code
      t.string :name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
