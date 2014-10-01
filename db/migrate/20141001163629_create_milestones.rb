class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.integer :wordcount, null: false
      t.timestamps
    end
  end
end
