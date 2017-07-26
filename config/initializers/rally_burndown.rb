require "httparty"
require "json"
require "rufus-scheduler"

USERNAME = "kleahey@commonapp.org"
PASSWORD = "Planet@ry7"
DAYFROM = "2017-07-09T04:00:00Z"
DAYTO = "2017-07-10T04:00:00Z"

  class RallyService
    include HTTParty

    format :json
    base_uri "https://rally1.rallydev.com"

    def initialize(username, password)
      @options = {
        basic_auth: {
          username: username,
          password: password
        },
        headers: {
          "Content-Type" => "text/javascript;charset=utf-8"
        }
      }
    end

    def sync_tasks(to_day)

      options = @options.merge({ body: {"find":{"_TypeHierarchy": "Task", __At: to_day},"start": 0, "pagesize": 50000, "fields": ["_UnformattedID","ToDo", "Project"]}.to_json })
      self.class.post("/analytics/v2.0/service/rally/workspace/3739944172/artifact/snapshot/query.js", options)

    end

  end

  scheduler = Rufus::Scheduler.new

  scheduler.every '1h', :first_in => '10s' do

    rally = RallyService.new(USERNAME, PASSWORD)

    response = rally.sync_tasks(DAYTO)
    tasks = JSON.parse(response.body)

    @array = []
    tasks["Results"].each do |x|
      @array.delete_if { |item| item[:id]==x["_Unformatted_id"] }
      hash = { :id => x["_UnformattedID"], :todo => x["ToDo"], :project => x["Project"] }
      @array.push(hash)
    end

    @array.delete_if { |item| item[:todo]==0 }

    @array.each do |a|
      a = Task.find_or_initialize_by(unformatted_id: a[:id])
      a.historical_date = DAYFROM
      a.todo = a[:todo]
      a.project = a[:project]
      a.save
    end

  end
