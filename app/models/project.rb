class Project < ActiveRecord::Base
  validates :title, :wordcount_goal, :active, :current_wordcount, presence: true
  validates :title, length: { in: 1..130 }
  validates :goal_time_limit, :current_wordcount, numericality: true
  validate :project_deadline_date_cannot_be_in_the_past
  belongs_to :user

  def project_deadline_date_cannot_be_in_the_past
    if goal_deadline_date && goal_deadline_date < Date.today
      errors.add(:goal_deadline_date, "has to be in the future!")
    end
  end
end
