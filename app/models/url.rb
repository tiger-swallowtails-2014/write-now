require 'faker'

class UrlShortener
  def before_save(url)
    url.short_url = Faker::Internet.password(6)
  end
end

class Url < ActiveRecord::Base
  belongs_to :user
  # Remember to create a migration!
  before_save UrlShortener.new

  def counter_increment
    p self.click_count
    # self.update(:click_count => self.click_count+1)
    self.click_count = self.click_count+1
    p self.click_count
  end

end

