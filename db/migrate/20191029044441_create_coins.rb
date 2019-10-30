class CreateCoins < ActiveRecord::Migration[5.2]
  def change
    create_table :coins do |t|
      t.string :denomination
      t.text :description
      t.integer :price
      t.integer :condition
      t.boolean :post_decimal
      t.integer :mint_year
      t.references :user, foreign_key: true
    end
  end
end
