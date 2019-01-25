namespace :post do
  desc "Getting Posts from NEWS_API"
  task get_all_news: :environment do
    puts "Get News for all teams..."
    NewsApiJob.perform_later
  end
end

# rails post:get_all_news
