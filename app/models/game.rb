class Game < ApplicationRecord
  belongs_to :tournament
  belongs_to :pool
  belongs_to :bracket, :optional => true
  belongs_to :home, :class_name => 'Team'
  belongs_to :away, :class_name => 'Team'
  belongs_to :ref,  :class_name => 'Team', :optional => true
  
  before_save :same_team
  after_save  :teams_caches

  def score_home
    s = read_attribute(:score_home)
    s.nil? ? 0 : s
  end
 
  def score_away
    s = read_attribute(:score_away)
    s.nil? ? 0 : s
  end
  
  def winner
    score_home > score_away ? home : away
  end
  
  def winner?(team)
    team == self.winner
  end
  
  def loser
    score_home > score_away ? away : home
  end
  
  def loser?(team)
    team == loser
  end
  
  def score_winner
    score_home > score_away ? score_home : score_away
  end
  
  def score_loser
    score_home > score_away ? score_away : score_home
  end

  def over?
    score_home != score_away
  end

  # Bracket

  def index
    bracket.games.index(self) if not bracket.nil?
  end

  def index_in_round
    bracket.games_in_round(round).index(self) if not bracket.nil?
  end

  def round
    i = 0
    (1..bracket.num_rounds).each do |r|
      i += bracket.num_games_in_round(r)
      return r if i > index
    end
  end

  def previous_games
    return nil if round == 1

    g = bracket.games_in_round(round - 1)
    g.slice(index_in_round * 2, 2)
  end
  
  private
  
    # TODO: this causes issues when creating nil games for brackets
    def same_team
      #raise Exception if home_id == away_id
    end
  
    def teams_caches
      if ! away.nil?
        away.plus_minus     = away.calculate_plus_minus
        away.win_percentage = away.calculate_win_percentage
        away.save
      end
      
      if ! home.nil?
        home.plus_minus     = home.calculate_plus_minus
        home.win_percentage = home.calculate_win_percentage
        home.save
      end
    end
  
end