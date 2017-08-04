class Task < ApplicationRecord
  belongs_to :project, primary_key: :assigned_id
  has_one :sprint

  def self.intro
    JsonFiles.task_index_intro
  end
end
