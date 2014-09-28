FactoryGirl.define do
	factory :project do
		title "Great American Novel"
		wordcount_goal 10
		goal_time_limit 40
		goal_deadline_date {'2015-12-01'}
		active true
		current_wordcount 5
	end
end