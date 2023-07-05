module SessionsHelper
  def login(user)
    session[:user_id] = user.id
  end
  
  def login_user
    @login_user ||= User.find_by(id: session[:user_id])
  end
  
  def logout
    session.delete(:user_id)
    login_now = nil
  end
  
  def login_now
    !login_user.nil?
  end
  
  def image_check
    if login_user.image.attached?
      login_user.image.purge
      params.require(:user).permit(:image, :name, :introduce)
    else
      params.require(:user).permit(:image, :name, :introduce)
    end
  end
  
  def before_page
    session[:url]
  end
end
