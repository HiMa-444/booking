class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      login(user) 
      flash[:notice] = "ログインしました"
      redirect_to users_path
    else
      flash[:notice] = "ログイン失敗"
      render 'new'
    end
  end
  
  def destroy
    logout
    flash[:notice] = "ログアウトしました"
    redirect_to users_path
  end
end
