class CreateVotes < ActiveRecord::Migration[5.2]
  def self.up
    create_table :votes do |t|
      t.string :side
      t.bigint :slack_id

      t.belongs_to :fite
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :votes
  end
end
