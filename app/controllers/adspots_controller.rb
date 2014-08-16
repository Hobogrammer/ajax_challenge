class AdspotsController < ApplicationController

  def new
    @agent  = Agent.new
    @adspot = Adspot.new
  end

  def create
    @agent = Agent.build(params[:agent])
    @adspot = @agent.adspot.build(params[:adspot])

    if adspot.save?
      redirect_to root_path, :flash => { :success => "Adspot registered successfully" }
    else
      redirect_to root_path, :flash => { :error => "The adspot selected could not be registered. Please try again later." }
    end
  end

  def show
    @adspot = Adspot.find(params[:id])
  end

  def index
    @adspots = Adspots.all
  end

  private

  def adspot_params
    params.require(:adspot).permit(:zipcode, :agent_id, :month)
  end
end
