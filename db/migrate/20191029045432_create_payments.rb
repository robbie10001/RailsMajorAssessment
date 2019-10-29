class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :stripe_id
      t.references :coin, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
