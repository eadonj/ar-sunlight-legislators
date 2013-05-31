require_relative '../app/models/politician'
require_relative '../app/models/tweet'
require 'twitter'
require 'debugger'



class TweetParser
  
  def self.tweet(congress_id)
    connection = initialize_connection
    politician = Politician.find(congress_id)
    tweets = connection.user_timeline(politician.twitter_id)
    tweets.each do |tweet|
      # debugger
      break if tweets.index(tweet) == 10
      Tweet.create!({tweet_id: tweet[:id], politician_id: politician[:id], body: tweet[:text]})
    end
  end

  def self.initialize_connection
    Twitter.configure do |config|
      config.consumer_key = "1iF6akIwL0wO3UmiuUJG1Q"
      config.consumer_secret = "091hacAhOjBQe3t510WfSnymxtmj1P02yazG2dLSbA"
    end
  end
end

TweetParser.tweet(1)
