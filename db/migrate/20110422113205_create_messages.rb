class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.string :lilyid
      t.string :stock_number
      t.string :stock_name
      t.text :nominate_reason
      t.string :price_nominate

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
