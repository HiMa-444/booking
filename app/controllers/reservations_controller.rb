class ReservationsController < ApplicationController
  def index
    @booking = Reservation.all
  end

  def new
    @data = Reservation.new
    session[:room_id] = params[:id]
  end
  
  def check
    @data = Reservation.new(params.require(:reservation).permit(:inday, :outday, :humans))
    @room = Room.find(params[:id])
  end

  def create
    if Reservation.create(params.require(:reservation).permit(:user_id, :inday, :outday, :humans, :period, :pey, :room_id))
      unless !session[:room_id].nil?
        session.delete[:room_id]
      end
      flash[:notice] = "予約が完了しました"
      redirect_to users_path
    else
      flash[:nocere] = "予約ができませんでした"
      render 'new'
    end
  end

  def destroy
  end
end
