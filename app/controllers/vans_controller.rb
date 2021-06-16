class VansController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @vans = Van.all
    policy_scope(Van)
  end

  def show
    @van = Van.find(params[:id])
    authorize @van
    @booking = Booking.find_by(user_id: current_user, van_id: @van)
  end

  def new
    @van = Van.new
    authorize @van
  end

  def create
    @van = Van.new(params_van)
    authorize @van
    @van.user = current_user
    if @van.save
      redirect_to van_path(@van)
    else
      render :new
    end
  end

  def edit
    @van = Van.find(params[:id])
    authorize @van
  end

  def update
    @van = Van.find(params[:id])
    authorize @van
    @van.update(params_van)
    redirect_to van_path(@van)
  end

  def destroy
    @van = Van.find(params[:id])
    authorize @van
    @van.destroy
    redirect_to vans_path
  end

  private

  def params_van
    params.require(:van).permit(:name, :model, :capacity, :van_city, :price_per_day)
  end
end
