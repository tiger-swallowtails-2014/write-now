class Project < ActiveRecord::Base
  belongs_to :user
  validates :title, :wordcount_goal, :active, :current_wordcount, presence: true
  validates :title, length: { in: 1..130 }
  validates :wordcount_goal, :current_wordcount, numericality: true
  validate :project_deadline_date_cannot_be_in_the_past

  def project_deadline_date_cannot_be_in_the_past
    errors.add(:goal_deadline_date, "has to be in the future!") if goal_deadline_date && goal_deadline_date < Date.today
  end

  def calculate_pace_needed_w_per_day_date
    wc_diff = self.wordcount_goal - self.current_wordcount
    date_diff = self.goal_deadline_date.mjd - Date.today.mjd
    "#{wc_diff / date_diff} words per day"
  end

  def calculate_pace_needed_w_per_day_hours
    wc_diff = self.wordcount_goal - self.current_wordcount
    time_to_write = self.goal_time_limit
    "#{wc_diff / time_to_write} words per hour"
  end
end
