class ReservationsController < ApplicationController
  respond_to :json

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.save
    respond_with(@reservation)
  end

  def destroy
    reservation = Reservation.find(params[:id])
    reservation.destroy
    respond_with(reservation)
  end
  
  def update
    reservation = Reservation.find(params[:id])
    reservation.update_attributes(reservation_params)
    respond_with(reservation)
  end
  private

  def reservation_params
    params.require(:reservation).permit(:start_time, :end_time, :table_id)
  end
end
