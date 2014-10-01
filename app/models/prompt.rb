class Prompt < ActiveRecord::Base
  def self.random_prompt
    Prompt.all.shuffle.sample
  end
end
