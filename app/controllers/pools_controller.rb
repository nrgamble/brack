class PoolsController < ApplicationController

  before_filter :authenticate_user!, :only => [ :index, :new, :edit ]

  def index
    @pools = Pool.all
  end

  def show
    @pool = Pool.find(params[:id])
  end
  
  def new
    @pool = Pool.new
    @tournament = Tournament.find(params[:tournament_id])
  end
  
  def edit
    @pool = Pool.find(params[:id])
    @tournament = @pool.tournament
  end

  def create
    @pool = Pool.new(pool_params)

    if @pool.save
      redirect_to @pool
    else
      render :action => :new
    end
  end
  
  def update
    @pool = Pool.find(params[:id])

    if @pool.update_attributes(pool_params)
      redirect_to @pool
    else
      redirect_to edit_pool_url(@pool)
    end
  end
  
  def destroy
    @pool = Pool.find(params[:id])
    @pool.destroy
   
    redirect_to @pool.tournament
  end

  private

    def pool_params
      params.require(:pool).permit(:tournament_id, :name)
    end

end