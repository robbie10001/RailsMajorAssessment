class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :coin_id
      t.string :user_id
      t.string :stripe_id

      t.timestamps
    end
  end
end
