class CitizensController < ApplicationController
  def index
    @citizens = Citizen.all
    # flash.now[:notice] = "Successfully created..."
  end

  def show
    @citizen = Citizen.find(params[:id])
    @convocation = Convocation.new
    @restriction = Restriction.new 
    @flag = Flag.new 
    @conviction = Conviction.new
  end

  def edit
  end

  def create
    @citizen = Citizen.new(user_params)

    if @citizen.save
      flash[:notice] = "Account was succesfully created..."
      redirect_to sign_in_path
    else
      render :new
    end
  end

  def update
  end
end
