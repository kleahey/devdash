class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.datetime :historical_date
      t.string :project
      t.float :todo

      t.timestamps
    end
  end
end
