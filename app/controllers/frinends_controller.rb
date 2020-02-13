class FrinendsController < ApplicationController
  before_action :authorize
  skip_before_action :verify_authenticity_token

  def view
    user_id = User.find(session[:user_id]) if session[:user_id]
    arr = Friend.select(:id_friend).where(id_user: user_id.id.to_i )
    @res=[]
    arr.each do |x|
      @res << [["#{User.find(x.id_friend.to_i).name} #{User.find(x.id_friend.to_i).surname}"],[User.find(x.id_friend.to_i).id]]
    end
  end

  def add
    name = params[:name]

    respond_to do |format|
      format.html
      format.json do
        render json: { man: User.select(:id, :name, :surname).where(name: name).where.not(id: session[:user_id]).where("users.id not in (SELECT id_friend FROM friends WHERE id_user = ?)",session[:user_id])
                                .or(User.select(:id, :name, :surname).where(surname: name ))
        }
      end
    end
  end

  def add_friend
    user_id = User.find(session[:user_id]) if session[:user_id]
    frined_id = params[:add_friend].to_i
    frends = Friend.new
    frends.sql_add_friend frined_id, user_id.id

    redirect_to '/view_friends'
  end

end
