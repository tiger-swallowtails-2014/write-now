class Quote < ActiveRecord::Base
  def self.random_quote
    Quote.all.shuffle.sample
  end
end