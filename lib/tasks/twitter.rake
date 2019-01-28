namespace :twitter do
  desc "Getting Tweets from Twitter_API"
  task get_tweets: :environment do
    puts "Get Tweets for all teams..."
    TwitterApiJob.perform_later
  end
end

# rails twitter:get_tweets
