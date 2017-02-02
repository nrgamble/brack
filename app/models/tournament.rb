class Tournament < ApplicationRecord
  has_one :bracket, :dependent => :destroy

  has_many :pools, :dependent => :destroy
  has_many :teams
  
  def standings
    self.teams.sort { |x,y| Team.sort_standings(y, x) }
  end

  def pools_ready?
    teams.each do |t|
      return false if t.pool.nil?
    end
    true
  end
  
end