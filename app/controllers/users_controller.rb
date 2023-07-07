class UsersController < ApplicationController
  def index
    @users = User.all
    @room = Room.all
  end
  
  def new
  end
  
  def create
    user = User.new(params.require(:user).permit(:image, :name, :email, :password, :password_confirmation, :introduce))
    if user.save
      flash[:notice] = "登録完了"
      login(user)
      redirect_to users_path
    else
      flash[:no] = "内容に不備があり"
      render new_user_path
    end
  end
  
  def show
    @user = login_user
    @booking = @user.reservations
    @demo = Reservation
    if !login_now
      redirect_to users_path
    end
    
  end
  
  def edit
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update!(params.require(:user).permit(:image, :name, :introduce, :password))
      redirect_to users_path
    else
      render 'edit'
    end
  end
  
  def destroy
    
  end
end
