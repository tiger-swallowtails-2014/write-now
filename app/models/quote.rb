class Quote < ActiveRecord::Base

  def random_quote
    count = Quote.count
    Quote.offset(rand(count)).first
  end

end