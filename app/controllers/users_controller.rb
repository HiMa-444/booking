class UsersController < ApplicationController
  def index
    @users = User.all
    @room = Room.all
  def new
  end
  
  def create
    user = User.new(params.require(:user).permit(:image, :name, :email, :password, :password_confirmation, :introduce))
    if user.save
      flash[:notice] = "登録完了"
      redirect_to users_path
    else
      flash[:no] = "内容に不備があり"
      render new_user_path
    end
  end
  
  def show
    user = User.find_by(id: login_user.id)
    @booking = user.reservations
    @demo = Reservation
    if !login_now
      redirect_to users_path
    end
    
  end
  end
  
  def edit
    @user = login_user
  end
  
  def update
    if @user = User.update(image_check)
      flash[:notice] = "更新完了"
      redirect_to users_path
    else
      flash[:noup] = "更新失敗"
      render 'edit'
    end
  end
  
  def destroy
    
  end
end
