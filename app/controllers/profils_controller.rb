class ProfilsController < ApplicationController
  def dashboard
    @vans_user = policy_scope(Van).where(user_id: current_user)
    authorize @vans_user
    vans_id = []
    @vans_user.each do |van_user|
      vans_id << van_user.id
    end
    @bookings_user = policy_scope(Booking).where(van_id: vans_id)
    authorize @bookings_user
  end
end
