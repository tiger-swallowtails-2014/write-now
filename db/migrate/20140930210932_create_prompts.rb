class CreatePrompts < ActiveRecord::Migration
  def change
    create_table :prompts do |t|
      t.string :prompt

      t.timestamps
    end
  end
end
