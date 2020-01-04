class CreateFites < ActiveRecord::Migration[5.2]
  def self.up
    create_table :fites do |t|
      t.string :left_side
      t.string :right_side

      t.belongs_to :fite_list
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :fites
  end
end
