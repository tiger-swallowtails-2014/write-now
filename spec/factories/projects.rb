FactoryGirl.define do
	factory :project do
		title "Great American Novel"
		wordcount_goal 10
		active true
		current_wordcount 5
	end
end