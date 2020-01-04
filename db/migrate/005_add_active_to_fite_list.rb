class AddActiveToFiteList < ActiveRecord::Migration[5.2]
  def self.up
    add_column :fite_lists, :active, :boolean, default: false, null: false
  end

  def self.down
    remove_column :fite_lists, :active, :boolean
  end
end
