require 'rally_api'

class RallyApi

  head = RallyAPI::CustomHttpHeader.new()
  head.name = "CAdashboards"
  head.vendor = "Kevin Leahey"
  head.version = "1.0"

  config = { :base_url => "https://rally1.rallydev.com/slm" }
  config[:api_key] = "_KhI5vEioRPuRgSmQrl5WdUZteH8wEC1vwv8IEoR4bM"
  config[:workspace] = "CA4"
  config[:project] = "CA Web App (Rooster)"
  config[:headers] = head

  @rally = RallyAPI::RallyRestJson.new(config)

  def self.sync_iterations
    api_iterations = @rally.find(RallyAPI::RallyQuery.new({ type: "Iteration" }))
    api_iterations.each do |api_iteration|
      api_iteration.read
      i = Iteration.find_or_initialize_by(object_id: api_iteration["ObjectID"])
      i.name = api_iteration["Name"]
      i.planned_velocity = api_iteration["PlannedVelocity"]
      i.start_date = api_iteration["StartDate"]
      i.end_date = api_iteration["EndDate"]
      i.project = api_iteration["Project"]
      i.state = api_iteration["State"]
      i.theme = api_iteration["Theme"]
      i.plan_estimate = api_iteration["PlanEstimate"]
      i.save
    end
  end

end
