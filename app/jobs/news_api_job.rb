class NewsApiJob < ApplicationJob
  queue_as :default

  def perform(team_id)
    team = Team.find(team_id)
    puts "Calling News_API for #{team.name}..."
    sleep 3
    puts "OK I'm done now with #{team.slug}"
  end
end
