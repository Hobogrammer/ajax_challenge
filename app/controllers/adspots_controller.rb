class AdspotsController < ApplicationController

  def new
    @price = 0.00
    @adspot = Adspot.new(adspot_params)

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
