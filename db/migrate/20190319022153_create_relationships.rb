class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.references :user, foreign_key: true
      t.references :stock, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :stock_id], unique: true
    end
  end
end
