class AgentsController < ApplicationController

  def new
    @agent  = Agent.new
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

  private

  def agent_params
    params.require(:agent).permit(:name, :description, :company, :city, :phone, :website)
  end
end
