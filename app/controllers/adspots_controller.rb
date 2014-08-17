class AdspotsController < ApplicationController

  def new
    @adspot = Adspot.new
  end

  def create
  end

  def get_adspot
    zipcode = params[:zipcode]
    @adspots = Adspot.where(zipcode:  zipcode).to_a
    create_number = 5 - @adspots.length

    if create_number > 0
      create_number.times do |x|
        @adspots << Adspot.new(zipcode: zipcode) #This definitely doesnt have to actually return an array of objects. They will not be used other than in form making.
      end
    end
    respond_to do |format|
      format.js
    end
  end

  private

  def adspot_params
    params.require(:adspot).permit(:zipcode, :agent_id, :month)
  end
end
