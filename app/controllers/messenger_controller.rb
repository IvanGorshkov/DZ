class MessengerController < ApplicationController
  before_action :authorize
  skip_before_action :verify_authenticity_token

  def messenger
    user_id = User.find(session[:user_id]) if session[:user_id]
    arr = Friend.select(:id_friend).where(id_user: user_id.id.to_i )
    @res=[]
    @dial=[]
    arr.each do |x|
      @res << [["#{User.find(x.id_friend.to_i).name} #{User.find(x.id_friend.to_i).surname }"],[User.find(x.id_friend.to_i).id]]
    end
    dialog = Message.select("max(id), user1, user2, message").where("user1 = ? or user2 = ?",user_id.id.to_i,user_id.id.to_i).group("case when user1 = #{user_id.id.to_i} then user2 else user1 end").order('created_at desc')
    dialog.each do |x|
      puts x.message
      if User.find(x.user2).id == user_id.id.to_i
          y = User.find(x.user1)
      else
         y = User.find(x.user2)
      end
      text = ''
      if x.message.length <= 200
        text = x.message
      else
        text = "#{x.message[0, 200]}..."
        end

      @dial << [["#{y.name} #{y.surname}"],[text], [y.id]]
    end
  end

  def dialog
     user_id = User.find(session[:user_id]) if session[:user_id]
     param = params[:id_friend].to_s

     @messenge_array=[]
     if  param != ''
    friend_id = User.find(param)
    @name_friend = "#{User.find(param).name} #{User.find(param).surname}"
    messenger = Message.select(:message,:who_wrote).where("user1 = ? AND user2 = ?", user_id.id, friend_id.id )
                    .or(Message.select(:message,:who_wrote).where("user1 = ? AND user2 = ?",friend_id.id ,  user_id.id ))
     messenger.each do |x|
      @messenge_array << [[x.who_wrote],[x.message]] if x.who_wrote.to_i == user_id.id.to_i
      @messenge_array << [[x.who_wrote],[x.message]] if x.who_wrote.to_i == friend_id.id.to_i
     end
     end
  end

  def send_
    user_id = User.find(session[:user_id]) if session[:user_id]
    param = params[:id_friend].to_s
    friend_id = User.find(param)
    messenge = params[:mes]
    Message.create([{ :user1 => user_id.id, :user2 => friend_id.id, :message =>messenge, :who_wrote => user_id.id}])
    respond_to do |format|
      format.html do
        render html: { mes:messenge }
      end
      format.json do
        render json: { mes:messenge }
      end
    end
  end
end
