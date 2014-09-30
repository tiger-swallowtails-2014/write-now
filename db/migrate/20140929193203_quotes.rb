class Quotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :quote
      t.string :quoter
      t.timestamps
    end
  end
end
