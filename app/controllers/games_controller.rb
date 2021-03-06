class GamesController < ApplicationController

  before_filter :authenticate_user!, :only => [ :index, :new ]
  
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end
  
  def new
    @game = Game.new
    @tournament = Tournament.find(params[:tournament_id])
    @pool = Pool.find(params[:pool_id])

    @game.date = Time.now
  end
  
  def edit
    @game = Game.find(params[:id])
    @tournament = @game.tournament
    @pool = @game.pool
    @teams = @pool.teams
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      respond_to do |format|
        format.html { redirect_to @game.pool }
        format.json { render :json => true }
      end
    else
      respond_to do |format|
        format.html { render :action => :new } # Need tourny/pool params
        format.json { render :json => false }
      end
    end
  end
  
  def update
    @game = Game.find(params[:id])

    if @game.update_attributes(game_params)
      respond_to do |format|
        format.html { redirect_to @game.bracket_id.nil? ? @game.pool : @game.bracket }
        format.json { render :json => true }
      end
    else
      redirect_to edit_game_url(@game)
    end
  end
  
  def destroy
    @game = Game.find(params[:id])
    @game.destroy
   
    redirect_to @game.pool
  end

  private

    def game_params
      params.require(:game).permit(:tournament_id, :pool_id, :date, :court_id, :ref_id, :away_id, :score_away, :home_id, :score_home)
    end

end