class Friend < ApplicationRecord

  def  sql_add_friend id_friend_, id_user_
    add id_friend_, id_user_
  end

  private

  def add  id_friend_, id_user_
    puts id_friend_
    puts id_user_
    Friend.create([{ :id_friend => id_friend_, :id_user => id_user_ }, {:id_friend => id_user_, :id_user => id_friend_}])
  end
end
