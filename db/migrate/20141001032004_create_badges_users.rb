class CreateBadgesUsers < ActiveRecord::Migration
  def change
    create_table :badges_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :badge
    end
  end
end
