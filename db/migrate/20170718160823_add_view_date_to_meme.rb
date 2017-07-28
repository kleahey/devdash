class AddViewDateToMeme < ActiveRecord::Migration[5.1]
  def change
    add_column :memes, :view_date, :datetime
  end
end
