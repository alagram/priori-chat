class CreateOnlineUsers < ActiveRecord::Migration
  def change
    create_table :online_users do |t|
      t.string :username
      t.timestamps
    end
  end
end
