class RemoveCaptionFromMeme < ActiveRecord::Migration[5.1]
  def change
    remove_column :memes, :caption
  end
end
