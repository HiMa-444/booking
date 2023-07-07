class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      login(user) 
      redirect_to users_path
    else
      render 'new'
    end
  end
  
  def destroy
    logout
    flash[:notice] = "ログアウトしました"
    redirect_to top_path
  end
end
