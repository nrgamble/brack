class TournamentsController < ApplicationController

  before_filter :authenticate_user!, :only => [ :index, :new, :edit ]

  def dee
    t = Tournament.first
    redirect_to t
  end
  
  def index
    @tournaments = Tournament.all
  end
    
  def new
    @tournament = Tournament.new
    @tournament.date = DateTime.now
    
    @h1 = 'New Tournament'
  end
  
  def edit
    @tournament = Tournament.find(params[:id])
    @h1 = 'Edit Tournament'
  end

  def show
    @tournament = Tournament.find(params[:id])
    @h1 = @tournament.name
  end

  def create
    @tournament = Tournament.new(tournament_params)

    if @tournament.save
      Bracket.new({ :tournament_id => @tournament.id }).save # TODO: do this with model association create
      redirect_to @tournament
    else
      render :action => :new
    end
  end
  
  def update
    @tournament = Tournament.find(params[:id])

    if @tournament.update_attributes(tournament_params)
      redirect_to @tournament
    else
      redirect_to edit_tournament_url(@tournament)
    end
  end
  
  def destroy
    @tournament = Tournament.find(params[:id])
    @tournament.destroy
   
    redirect_to tournaments_url
  end

  private

    def tournament_params
      params.require(:tournament).permit(:name, :date, :location)
    end

end