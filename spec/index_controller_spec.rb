require_relative 'spec_helper'

describe "index_controller" do
  describe "GET /index"  do
    it "renders a successful status" do
      get '/'
      expect(last_response.status).to eq(200)
    end
  end


  describe "POST /" do
    it "renders a successful status" do
      expect {
        post "/", url: "http://www.google.com"
      }.to change { Url.count }

    end
  end

  before(:each) do
    @user_url = Url.create(:url => "http://www.google.com")
  end

  describe "POST /" do
    it "creates shortened url" do
      Url.delete_all
      post "/", url: "http://www.google.com"
      expect(@user_url.short_url).not_to be_nil
    end
  end

  describe "GET /:short_url" do
      it "resolves to desired url" do
        short_url = @user_url.short_url
        post "/#{short_url}"
          expect(last_response).to be_redirect
          follow_redirect!
          last_request.url.should == 'http://www.google.com/'
          # expect(response).to redirect_to(@user_url.url)
    end
  end


end