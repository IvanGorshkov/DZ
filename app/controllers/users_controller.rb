class UsersController < ApplicationController
  def new
    redirect_to '/'  if current_user
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      #redirect_to '/signup'
    end
  end
  private
  def user_params
    params.require(:user).permit(:nick, :name, :surname, :email, :password,:password_confirmation)
  end

end
