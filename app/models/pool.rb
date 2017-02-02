class Pool < ApplicationRecord
  belongs_to :tournament
  
  has_many :teams, :dependent => :destroy
  has_many :games
  
  def standings
    teams.sort { |x,y| Team.sort_standings(y, x) }
  end

  def schedule
    games.sort { |x,y| x.date <=> y.date }
  end
  
end