class CreateIterations < ActiveRecord::Migration[5.1]
  def change
    create_table :iterations do |t|
      t.string :object_id
      t.datetime :end_date
      t.string :name
      t.integer :planned_velocity
      t.string :project
      t.datetime :start_date
      t.string :state
      t.string :theme
      t.integer :plan_estimate

      t.timestamps
    end
  end
end
