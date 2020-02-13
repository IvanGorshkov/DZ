class NewsController < ApplicationController
  before_action :authorize
  def posts
    user_id = User.find(session[:user_id]) if session[:user_id]
    arr = Friend.select(:id_friend).where(id_user: user_id.id.to_i )
    @res_posts=[]
    News.select(:post, :user, :created_at).where("user = ? ",user_id.id.to_i).each do |elem|
      y = User.find(elem.user)
      @res_posts << [["#{y.name} #{y.surname}"],[elem.post],[elem.created_at],[user_id.id.to_i]]
    end
    arr.each do |x|
      puts x.id
      News.select(:post, :user, :created_at).where("user = ? ",x.id_friend.to_i).each do |elem|
        y = User.find(elem.user)
        @res_posts << [["#{y.name} #{y.surname}"],[elem.post],[elem.created_at],[elem.user.to_i]]
      end
    end
    @res_posts.sort! { |a, b| b[2] <=> a[2] }
  end

  def post_add
    user_id = User.find(session[:user_id]) if session[:user_id]
  @text = params[:post]
    post = News.new
    post.post = @text
    post.user = user_id.id
    post.save
    respond_to do |format|
      format.html
      format.js { render inline: "location.reload();" }
    end
  end

  def post_get
      puts @text
      respond_to do |format|
        format.html
        format.json do
          render json: { text: News.last
          }
        end
      end

  end
end
