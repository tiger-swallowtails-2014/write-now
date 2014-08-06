require 'faker'

class UrlShortener
  def before_save(url)
    url.short_url = Faker::Internet.password(6)
  end
end

class Url < ActiveRecord::Base
  # Remember to create a migration!
  before_save UrlShortener.new
end

