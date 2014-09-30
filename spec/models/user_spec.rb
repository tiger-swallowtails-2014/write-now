require 'rails_helper'

describe User do
  let!(:user) { create :user }
  context "migration validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }

    it { should ensure_length_of(:email).is_at_least(1) }

    it { should validate_uniqueness_of(:email) }
  end

  context "association validations" do
    it {should have_many :projects}
  end
end