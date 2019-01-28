require 'twitter'

class TwitterApiJob < ApplicationJob
  queue_as :default

  def perform(*args)
    teams = Team.all
    Post.where(source: "Twitter").destroy_all

    # For Searching:
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_KEY_SECRET']
      config.access_token        = ENV['TWITTER_OA_TOKEN']
      config.access_token_secret = ENV['TWITTER_OA_TOKEN_SECRET']
    end

    teams.each do |team|
      puts "Calling Twitter_API for #{team.name}..."
      client.search("\##{team.slug.gsub(" ", "")} -rt", { lang: "en", result_type: "popular" } ).take(20).collect do |tweet|
        Post.create(
          title: tweet.user.screen_name,
          content: tweet.text,
          link: tweet.url,
          team_id: team.id,
          source: "Twitter"
        )
      end
      puts "OK I'm done now with #{team.slug}"
    end
  end
end
