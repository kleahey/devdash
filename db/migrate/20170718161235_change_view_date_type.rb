class ChangeViewDateType < ActiveRecord::Migration[5.1]
  def up
    change_column :memes, :view_date, :date
  end

  def down
    change_column :memes, :view_date, :datetime
  end
end
