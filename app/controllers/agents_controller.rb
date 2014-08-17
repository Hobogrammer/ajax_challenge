class AgentsController < ApplicationController

  def new
    @agent  = Agent.new
    @adspot = Adspot.new
  end

  def create
    @agent = Agent.create(agent_params)
    count = 0
    params.each_key {|key| key.include?("Adspot") ? count +=1 : false }
    if @agent.save
      count.times do |x|
        @agent.adspots.build(zipcode: params[:zipcode]).save
      end
      redirect_to root_path, :flash => { :success => "Adspot registered successfully" }
    else
      redirect_to root_path, :flash => { :error => "The adspot selected could not be registered. Please try again later." }
    end
  end

  private

  def agent_params
    params.require(:agent).permit(:name, :description, :company, :city, :phone, :website)
  end
end
