require 'rails_helper'

describe Project do
	let!(:project) { create :project}

	context "migration validations" do
		it "is valid with a title, wordcount goal, active, and current word count" do
			expect(project).to be_valid
		end

		it "is invalid without a title" do
			project = build(:project, title: nil)
			expect(project).to have(2).errors_on(:title)
		end

		it "is invalid when a title is over 130 characters" do
			project = build(:project, title: "Success is nothing more than a few simple disciplines, practiced every day; while failure is simply a few errors in judgment, repeated every day. It is the accumulative weight of our disciplines and our judgments that leads us to either fortune or failure")
			expect(project).to have(1).errors_on(:title)
		end

		it "is invalid without a wordcount goal" do
			project = build(:project, wordcount_goal: nil)
			expect(project).to have(1).errors_on(:wordcount_goal)
		end

		it "is invalid without an active" do
			project = build(:project, active: nil)
			expect(project).to have(1).errors_on(:active)
		end

		it "is invalid without a current wordcount" do
			project = build(:project, current_wordcount: nil)
			expect(project).to have(2).errors_on(:current_wordcount)
		end
	end

	context "association validations" do
		it {should belong_to :user}
	end
end
