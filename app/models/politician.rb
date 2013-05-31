require_relative '../../db/config'

class Politician < ActiveRecord::Base
  has_many :tweets

  # validat es_uniqueness_of :twitter_id
  # validates_format_of :phone, :with => /^[()0-9\-\+\s]+/

end
