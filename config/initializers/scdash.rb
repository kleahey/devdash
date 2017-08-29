require "rufus-scheduler"
require "#{Rails.root}/app/services/parature.rb"

scheduler = Rufus::Scheduler.new

scheduler.every "10s" do
  Parature.active_app_tickets
end
