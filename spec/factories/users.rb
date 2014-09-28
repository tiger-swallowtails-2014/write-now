FactoryGirl.define do
	factory :user do
		password_digest "god"
		sequence(:email) { |n| "me#{n}@me.com"}
	end
end