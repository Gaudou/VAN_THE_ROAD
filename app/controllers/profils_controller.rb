class ProfilsController < ApplicationController
  def dashboard
    # recup les vans du user actuel
    @vans_user = policy_scope(Van).where(user_id: current_user)
    authorize @vans_user
    vans_id = []
    @vans_user.each do |van_user|
      vans_id << van_user.id
    end
    # recup les bookings demande sur les vans precedents
    @bookings_user = policy_scope(Booking).where(van_id: vans_id)
    authorize @bookings_user
    # recup les bookings que l'utilisateur actuel a cree
    @my_bookings = Booking.where(user_id: current_user)
  end
end
