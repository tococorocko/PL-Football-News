namespace :post do
  desc "Getting Posts from NEWS_API"
  task get_all_news: :environment do
    teams = Team.all
    puts "Get News for #{teams.size} teams..."
    teams.each do |team|
      NewsApiJob.perform_later(team.id)
    end
  end
end

# rails post:get_all_news
