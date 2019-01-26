require 'news-api'

class NewsApiJob < ApplicationJob
  queue_as :default

  def perform
    newsapi = News.new(api_key = ENV['NEWS_API_TOKEN'])
    teams = Team.all
    Post.where(source: "News_API").destroy_all

    teams.each do |team|
      puts "Calling News_API for #{team.name}..."
      top_headlines = newsapi.get_top_headlines(q: team.slug,
                                                category: 'sports',
                                                language: 'en',
                                                country: 'gb')
      top_headlines.each do |headline|
        Post.create(
          title: headline.title,
          content: headline.description,
          link: headline.url,
          team_id: team.id,
          source: "News_API"
        )
      end
      puts "OK I'm done now with #{team.slug}"
    end
  end
end

# https://newsapi.org
