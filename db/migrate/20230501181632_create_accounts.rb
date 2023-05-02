class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.string :type, null: false
      t.money :starting_balance, null: false, default: 0

      t.timestamps
    end
  end
end
