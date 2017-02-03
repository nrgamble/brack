class Pool < ApplicationRecord
  belongs_to :tournament
  
  has_many :teams, :dependent => :destroy
  has_many :games
  
  def standings
    teams.sort { |x,y| Team.sort_standings(y, x) }
  end

  def schedule
    _schedule = {}
    # games.sort { |x,y| x.date <=> y.date }
    games.each { |g|
      day = "#{g.date.year}-#{g.date.month}-#{g.date.day}"
      _schedule[day] = [] unless _schedule.has_key?(day)
      _schedule[day] << g
    }
    _schedule
  end
  
end