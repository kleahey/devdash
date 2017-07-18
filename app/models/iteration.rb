class Iteration < ApplicationRecord
  def self.sync_from_api
    RallyApi.sync_iterations
  end
end
