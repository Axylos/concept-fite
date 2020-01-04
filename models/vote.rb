class Vote < ActiveRecord::Base
  belongs_to :fite
  validates_presence_of :slack_id, :side
  validates_uniqueness_of :fite_id, scope: :slack_id
end
