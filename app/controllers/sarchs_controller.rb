class SarchsController < ApplicationController
  def index
    @room = $room
    unless @room
      session[:url] = request.referer
    end
  end
  
  def new
  end
  
  def create
    data = Room.where(address: params[:address]).or(Room.where(address: params[:area]))
        .or(Room.where(room_name: params[:room_name])
        .or(Room.where(room_detail: params[:room_detail])))
    $room= data
    redirect_to result_path
  end
  
  def destroy
  end
end
