class UsersController < ApplicationController
  def top
  end
  
  def index
    @users = User.all
    @room = Room.all
  end
  
  def new
  end
  
  def create
    user = User.new(params.require(:user).permit(:image, :name, :email, :password, :password_confirmation, :introduce))
    if user.save
      login(user)
      redirect_to top_path
    else
      render new
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
  
  def account_edit
  end
  
  def account_update
    user = User.find(params[:id])
    if user.authenticate(params[:user][:old])
      if user.update(params.require(:user).permit(:email, :password))
        redirect_to users_path
      end
    else
      render 'account_edit'
    end
  end
  def destroy
    
  end
end
