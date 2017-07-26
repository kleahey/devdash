class AddUnfomattedIdToTask < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :unformatted_id, :integer
  end
end
