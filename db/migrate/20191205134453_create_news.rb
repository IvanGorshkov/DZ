class CreateNews < ActiveRecord::Migration[6.0]
  def change
    create_table :news do |t|
      t.string :user
      t.string :post

      t.timestamps
    end
  end
end
