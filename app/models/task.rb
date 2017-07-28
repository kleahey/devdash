class Task < ApplicationRecord
  belongs_to :project, primary_key: :assigned_id
end
