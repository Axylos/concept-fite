class Fite < ActiveRecord::Base
  has_many :votes
  belongs_to :fite_list
  validates_presence_of :left_side, :right_side, :fite_position
  validates_uniqueness_of :fite_position, scope: :fite_list

  def set_pos
    pos = Fite.where(fite_list_id: self.fite_list_id).order(fite_position: :desc).first&.fite_position || 0
    pos += 1
    self.fite_position = pos
  end
end
