class ChangeAssignedIdToBigintOnProjects < ActiveRecord::Migration[5.1]
  def change
    change_column :projects, :assigned_id, :bigint
  end
end
