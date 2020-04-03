class RidemechanicsController < ApplicationController

  def create
    ride = Ride.find(ridemechanic_params[:ride])
    mechanic = Mechanic.find(ridemechanic_params[:mechanic_id])
    Ridemechanic.create(ride: ride, mechanic: mechanic)
    redirect_to "/mechanics/#{ridemechanic_params[:mechanic_id]}"
  end

  private

  def ridemechanic_params
    params.permit(:mechanic_id, :ride)
  end

end
