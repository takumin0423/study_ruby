class CreateAccountRanks < ActiveRecord::Migration[5.2]
  def change
    create_table :account_ranks do |t|
      t.belongs_to :account
      t.integer :rank
      t.timestamps

      t.index :rank
    end
  end
end
