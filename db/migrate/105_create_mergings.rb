class CreateMergings < ActiveRecord::Migration
  def self.up
    create_table :mergings do |t|
      t.integer :article_id
      t.integer :merged_id

      t.timestamps
    end
  end

  def self.down
    drop_table :mergings
  end
end
