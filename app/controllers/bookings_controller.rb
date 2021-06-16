class BookingsController < ApplicationController
  def new
    @van = Van.find(params[:van_id])
    @booking = Booking.new
    policy_scope(Booking)
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
      @van.save
      redirect_to van_path(@van)

    else
      render :new
    end
  end

  def accept
    authorize @booking
  end

  def decline
    authorize @booking
  end

  def destroy
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:starting_date, :ending_date)
  end
end
