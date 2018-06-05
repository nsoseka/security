class ConvictionsController < ApplicationController
  def create
    @agent = Agent.first
    @conviction = Conviction.new(conviction_params)
    @citizen = Citizen.find(params[:citizen_id])
    @conviction.citizen = @citizen
    @conviction.agent = @agent
    @conviction.court_id = 1
    @convocation = Convocation.new
    @flag = Flag.new
    @restriction = Restriction.new

    if @conviction.save
      redirect_to @citizen
    else
      @add_fail = 'conviction'
      render "citizens/show", anchor: '#new_conviction'
    end
  end

  def update
  end

  private 

  def conviction_params
    params.require(:conviction).permit(:charge, :sentence, :judge, :sentenced_on)
  end
end
