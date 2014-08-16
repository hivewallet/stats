class CreateWebWalletCounts < ActiveRecord::Migration
  def change
    create_table :web_wallet_counts do |t|
      t.integer :count
      t.text :raw

      t.timestamps
    end
  end
end
