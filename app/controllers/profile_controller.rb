class ProfileController < ApplicationController
  before_action :authorize
  def me
    @id_user = params[:id_user]
    if @id_user == nil

    else
      begin
        @frineduser ||= User.find(@id_user)
      rescue Exception => e
        puts  e
      end
    end
  end
end
