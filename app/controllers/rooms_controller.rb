class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    session[:url] = request.referer
  end
  
  def new
  end
  
  def create
    room = Room.new(params.require(:room).permit(:room_image, :room_name, :room_detail, :room_introduce, :room_much, :address))
    if room.save
      redirect_to rooms_path
    else
      render 'new'
    end
  end
  
  def show
    @room = Room.find(params[:id])
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
end
