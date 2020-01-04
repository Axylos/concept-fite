class AddFitePositionToFite < ActiveRecord::Migration[5.2]
  def self.up
    add_column :fites, :fite_position, :integer, nullable: false
  end

  def self.down
    remove_column :fites, :fite_position
  end
end
