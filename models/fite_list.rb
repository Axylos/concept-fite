class FiteList < ActiveRecord::Base
  has_many :fites
  validates_presence_of :title
  validates_inclusion_of :active, in: [true, false]
  validate :only_one_active

  protected

  def only_one_active
    return if self.active == false
    active_list = FiteList.where(active: true).first
    if active_list.nil?
      return true
    elsif active_list != self
      errors.add(:active, 'only one fight can be active at a time')
    end
  end
end
