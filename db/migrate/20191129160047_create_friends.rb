class CreateFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :friends do |t|
      t.decimal :id_user
      t.decimal :id_friend

      t.timestamps
    end
  end
end
