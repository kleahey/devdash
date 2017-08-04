class Task < ApplicationRecord
  belongs_to :project, primary_key: :assigned_id
  belongs_to :sprint

  def self.intro
    JsonFiles.task_index_intro
  end
end
