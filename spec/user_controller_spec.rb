require_relative 'spec_helper'

describe "user_controller" do
  describe "GET /signup"  do
    it "renders a successful status" do
      get '/'
      expect(last_response.status).to eq(200)
    end
  end

  describe "POST /signup" do
    it "creates new user" do
      User.delete_all
      expect {
      post "/signup", user_name: "MMicheleM", password: "g00gle"
      }.to change {User.count}
    end
  end

  describe "GET /login"  do
    it "renders a successful status" do
      get '/login'
      expect(last_response.status).to eq(200)
    end
  end

  # describe "POST /login" do
  #   it "sets user's login_status to true" do
  #     expect {
  #     post "/login", user_name: "MMicheleM", password: "g00gle"
  #     }.to change {User.login_status}
  #   end
  # end


end