class CreateCoins < ActiveRecord::Migration[5.2]
  def change
    create_table :coins do |t|
      t.integer :user_id
      t.string :denomination
      t.text :description
      t.integer :price
      t.integer :condition
      t.boolean :post_decimal
      t.integer :mint_year

      t.timestamps
    end
  end
end
