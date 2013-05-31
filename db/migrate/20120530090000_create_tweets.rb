class CreateTweets < ActiveRecord::Migration
  def change
     create_table :tweets do |t|
      t.integer :tweet_id
      t.integer :politician_id
      t.string :body
    end
  end
end
