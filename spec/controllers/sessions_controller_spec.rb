require 'rails_helper'

describe SessionsController do
  let!(:session_set) { session[:user_id] = 1 }

  context 'GET #new' do
    it "renders the 'new' view" do
      get :new
      expect(response).to be_success
    end
  end

  context 'POST #create' do
    let(:user) { create :user }
    it "returns success response code" do
      post :create, :session => attributes_for(:user)
      expect(response).to be_success
    end
  end

  context 'DELETE #destroy' do
    it "DELETE #destroy" do
      session_set
      delete :destroy
      expect(session[:user_id]).to eq(nil)
    end
  end

end