require 'rails_helper'

describe User do
  context "migration validations" do
    it "is valid with an email and password hash" do
      user = User.new(
        email: "me@me.com",
        password_hash: "god")
      expect(user).to be_valid
    end

    it "is invalid without an email" do
      expect(User.new(email: nil)).to have(2).errors_on(:email)
    end

    it "is invalid with a duplicate email" do
      User.create(email: "awesome@me.com", password_hash: "something")
      user = User.new(email: "awesome@me.com", password_hash: "something")
      expect(user).to have(1).errors_on(:email)
    end

    it "is invalid without an password hash" do
      expect(User.new(password_hash: nil)).to have(1).errors_on(:password_hash)
    end
  end

  context "association validations" do
    it {should have_many :projects}
  end
end