class BookingsController < ApplicationController
  def new
    @van = Van.find(params[:van_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @van = Van.find(params[:van_id])
    @user = current_user
    @booking.van = @van
    @booking.user = @user
    if @booking.save
      @booking.status = "pending"
      @booking.save
      @van.availability = false

      @van.save!
      redirect_to dashboard_path

    else
      render :new
    end
  end

  def accept
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.status = "accepted"
    @booking.save
    redirect_to dashboard_path # quand j'aurai la view rediriger au profil
  end

  def decline
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.status = "declined"
    @booking.save
    redirect_to dashboard_path
  end

  def destroy
    @van = Van.find(params[:van_id])
    @booking = Booking.find_by(van_id: @van, user_id: current_user)
    authorize @booking
    @booking.destroy
    redirect_to vans_path
  end

  private

  def booking_params
    params.require(:booking).permit(:starting_date, :ending_date)
  end
end
