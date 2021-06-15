class VansController < ApplicationController
  def index
  end

  def show
  end

  def new
    @van = Van.new
  end

  def create
    @van = Van.new(params_van)
    @user = User.new
    if @van.save
      redirect_to van_path(@van)
    else
      render :new
    end
  end

  def edit
    @van = Van.find(params[:id])
  end

  def update
    @van = Van.find(params[:id])
    @van.update(params_van)
    redirect_to van_path(@van)
  end

  def destroy
  end

  private

  def params_van
    params.require(:van).permit(:name, :model, :capacity, :van_city, :price_per_day)
  end
end
