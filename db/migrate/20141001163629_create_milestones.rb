class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.integer :wordcount, null: false
      t.belongs_to :project
      t.timestamps
    end
  end
end
