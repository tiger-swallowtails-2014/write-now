class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title, length: 130, null: false
      t.integer :wordcount_goal, null: false
      t.integer :goal_time_limit
      t.date :goal_deadline_date
      t.boolean :active, null: false, default: true
      t.integer :current_wordcount, null: false, default: 0

      t.timestamps
    end
  end
end
