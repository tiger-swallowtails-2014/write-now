class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.integer :wordcount_goal
      t.integer :goal_time_limit
      t.date :goal_deadline_date
      t.boolean :active
      t.integer :current_wordcount

      t.timestamps
    end
  end
end
