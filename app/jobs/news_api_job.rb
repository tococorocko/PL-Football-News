require 'news-api'

class NewsApiJob < ApplicationJob
  queue_as :default

  def perform
    newsapi = News.new(api_key = ENV['NEWS_API_TOKEN'])
    teams = Team.all

    teams.each do |team|
      puts "Calling News_API for #{team.name}..."
      top_headlines = newsapi.get_top_headlines(q: team.name,
                                                category: 'sports',
                                                language: 'en',
                                                country: 'gb')
      top_headlines.each do |headline|
        Post.create!(
          title: headline.name,
          content: headline.title,
          link: headline.url,
          team_id: team.id
        )
        puts "I'm in the headlines of #{team.name} now"
      end
      puts "OK I'm done now with #{team.slug}"
    end
  end
end



# https://newsapi.org
