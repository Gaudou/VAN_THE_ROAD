class VansController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    query = { model: params[:model], capacity: params[:capacity], van_city: params[:van_city] }
    if query.values.all? { |element| element == "" }
      @vans = Van.all
    else
      @vans = Van.search_global("#{params[:model]} #{params[:capacity]} #{params[:van_city]}")
    end
    policy_scope(Van)
    @markers = @vans.geocoded.map do |van|
      {
        lat: van.latitude,
        lng: van.longitude,
        info_window: render_to_string(partial: "info_window", locals: { van: van }),
         #<i class="fas fa-shuttle-van" style="color:#d98526"></i>
        image_url: helpers.asset_url('shuttle-van-solid')
      }

    end
  end

  def show
    @van = Van.find(params[:id])
    authorize @van
    @booking = Booking.find_by(user_id: current_user, van_id: @van)
    # will return nil if do not meet any record corresponding to my current_user & van_id, so not my booking
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
