class RidemechanicsController < ApplicationController
  def create
    Ridemechanic.create(ride_id: ride_mech_params[:ride], mechanic_id: ride_mech_params[:mechanic_id])
    redirect_to "/mechanics/#{ride_mech_params[:mechanic_id]}"
  end

  private

  def ride_mech_params
    params.permit(:mechanic_id, :ride)
  end
end
