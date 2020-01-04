class CreateFiteLists < ActiveRecord::Migration[5.2]
  def self.up
    create_table :fite_lists do |t|
      t.string :title
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :fite_lists
  end
end
