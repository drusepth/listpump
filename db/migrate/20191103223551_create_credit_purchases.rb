class CreateCreditPurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_purchases do |t|
      t.references :user, foreign_key: true
      t.integer :credits
      t.integer :paid_cents
      t.datetime :paid_at

      t.timestamps
    end
  end
end
