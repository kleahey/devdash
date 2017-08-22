class Task < ApplicationRecord
  belongs_to :sprint
  belongs_to :project, primary_key: :assigned_id

  def self.intro
    JsonFiles.task_index_intro
  end
end
