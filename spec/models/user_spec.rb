require 'rails_helper'

# CR Try using shoulda matchers here - it is a lot less code.
describe User do
  context "migration validations" do
    it "is valid with an email and password hash" do
      user = User.new(
        email: "me@me.com",
        password_digest: "god")
      expect(user).to be_valid
    end

    it "is invalid without an email" do
      expect(User.new(email: nil)).to have(2).errors_on(:email)
    end

    it "is invalid with a duplicate email" do
      User.create(email: "awesome@me.com", password_digest: "something")
      user = User.new(email: "awesome@me.com", password_digest: "something")
      expect(user).to have(1).errors_on(:email)
    end

    it "is invalid without an password digest" do
      expect(User.new(password_digest: nil)).to have(1).errors_on(:password_digest)
    end
  end

  context "association validations" do
    it {should have_many :projects}
  end
end
