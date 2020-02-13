class SessionController < ApplicationController
  def login
    redirect_to '/'  if current_user
  end

  def create
    user = User.find_by_nick(params[:nick])
    pass = params[:password]
    if user && user.authenticate(pass)
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:alert] = "Неправильный логин или пароль!"
      redirect_to '/login'
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
