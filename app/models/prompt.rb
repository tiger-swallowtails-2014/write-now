class Prompt < ActiveRecord::Base

  def random_prompt
    count = Prompt.count
    Prompt.offset(rand(count)).first
  end

end
