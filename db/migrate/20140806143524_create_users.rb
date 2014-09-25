class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :user_name, :password
      t.boolean :login_status, :default => false
      t.timestamps
    end
  end
end
