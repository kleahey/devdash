class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.bigint :project_id
      t.datetime :historical_date
      t.float :task_hours

      t.timestamps
    end
  end
end
