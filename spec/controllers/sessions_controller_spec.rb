require 'rails_helper'

describe SessionsController do
  context '#new' do
    it "GET :new" do
      get :new
      expect(response).to be_success
    end
  end

  context '#create' do
    it "POST #create"
  end

  context '#destroy' do
    it "DELETE #destroy"
  end

end