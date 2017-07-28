class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.integer :assigned_id
      t.integer :program_id
      t.string :name

      t.timestamps
    end
  end
end
