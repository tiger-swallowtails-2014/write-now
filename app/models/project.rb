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

  def calc_words_percent_completed
    100 - ( (self.wordcount_goal.to_f - self.current_wordcount.to_f) / self.wordcount_goal.to_f * 100)
  end

  def num_words_to_goal
    self.wordcount_goal - self.current_wordcount
  end

  def calculate_pace_per_hours
    (self.num_words_to_goal / hours_until_deadline).round(0)
  end

  def calculate_pace
    self.goal_time_limit ? self.calculate_pace_per_hours : self.calculate_pace_per_day
  end

  def time_until_deadline
    self.pace_unit == "day" ? self.days_until_deadline : self.hours_until_deadline
  end

  def days_until_deadline
    (self.goal_deadline_date - Date.today).to_f if self.pace_unit == "day"
  end

  def hours_until_deadline
    limit = self.goal_time_limit
    hours_passed = TimeDifference.between(Time.parse(DateTime.now.to_s), self.created_at.to_time).in_hours
    (limit - hours_passed).round(2)
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

  def completed?
    self.wordcount_goal_reached? || self.goal_deadline_reached?
  end

  def wordcount_goal_reached?
    self.wordcount_goal <= self.current_wordcount
  end

  def goal_deadline_reached?
    self.time_expired? || self.date_arrived?
  end

  def time_expired?
    self.hours_until_deadline <= 0 if self.pace_unit == "hour"
  end

  def date_arrived?
    self.days_until_deadline <= 0 if self.pace_unit == "day"
  end

end