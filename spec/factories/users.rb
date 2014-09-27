FactoryGirl.define do
	factory :user do
		password_hash "god"
		sequence(:email) { |n| "me#{n}@me.com"}
	end
end