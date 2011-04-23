class AddLilyidUniquenessInde < ActiveRecord::Migration
  def self.up
    add_index :messages,:lilyid,:unique=>true
  end

  def self.down
    remove_index :messages,:lilyid
  end
end
