class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :name
      t.text :description
      t.string :type, null: false
      t.references :account, null: false, foreign_key: { to_table: :accounts }
      t.references :envelope, null: false, foreign_key: { to_table: :accounts }
      t.date :date, null: false
      t.money :amount, null: false

      t.timestamps

      t.index [:date]
      t.index [:envelope_id, :date]
      t.index [:account_id, :date]
    end
  end
end
