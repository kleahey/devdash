require "httparty"
require "json"
require "pp"

class JsonFiles
  include HTTParty

  def self.task_index_intro
    response = HTTParty.get("https://s3-us-west-2.amazonaws.com/kpl.assets/json/task_view.json")
    @json = response.body
  end

end
