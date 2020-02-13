class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :user1
      t.string :user2
      t.string :who_wrote
      t.string :message

      t.timestamps
    end
  end
end
