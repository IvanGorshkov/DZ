class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nick
      t.string :name
      t.string :surname
      t.string :password_digest

      t.timestamps
    end
  end
end
