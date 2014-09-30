class Project < ActiveRecord::Base
  belongs_to :user
  validates :title, :wordcount_goal, :active, :current_wordcount, presence: true
  validates :title, length: { in: 1..130 }
  validates :wordcount_goal, :current_wordcount, numericality: true
  validate :project_deadline_date_cannot_be_in_the_past

  def project_deadline_date_cannot_be_in_the_past
    errors.add(:goal_deadline_date, "has to be in the future!") if goal_deadline_date && goal_deadline_date < Date.today
  end

  def calculate_pace_per_day
    (self.wordcount_goal - self.current_wordcount) / days_until_deadline
  end

  def num_words_to_goal
    self.wordcount_goal - self.current_wordcount
  end

  def calculate_pace_per_hours
    (self.num_words_to_goal / hours_until_deadline).to_f
  end

  def calculate_pace
    self.goal_time_limit ? self.calculate_pace_per_hours : self.calculate_pace_per_day
  end

  def days_until_deadline
    (self.goal_deadline_date - Date.today).to_f if self.pace_unit == "day"
  end

  def hours_until_deadline
    limit = self.goal_time_limit
    hours_passed = TimeDifference.between(Time.parse(DateTime.now.to_s), self.created_at.to_time).in_hours
    limit - hours_passed
  end

  def pace_unit
    self.goal_time_limit ? "hour" : "day"
  end

  def check_goal_type
    self.goal_time_limit ? :hours : :days
  end

  def active_project(current_user)
    current_user.projects.last if current_user.projects.last.active
  end
end