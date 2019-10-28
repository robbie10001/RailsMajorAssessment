class ChangeUserIdToBeReferencesInTransactions < ActiveRecord::Migration[5.2]
  def change
    remove_column :transactions, :user_id, :integer
    add_reference :transactions, :users, index: true

    remove_column :transactions, :coin_id, :integer
    add_reference :transactions, :coins, index: true

    remove_column :coins, :user_id, :integer
    add_reference :coins, :users, index: true 
  end
end
