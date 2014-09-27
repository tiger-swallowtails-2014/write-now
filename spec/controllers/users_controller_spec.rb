require 'rails_helper'

describe UsersController, :type => :controller do
	let!(:user) { create :user }
	describe 'GET #new' do
		it "assigns a new user to @user" do
			get :new
			expect(assigns(:user)).to be_a_new(User)
		end

		it "redirects to projects#index" do

			expect(response).to redirect_to user_projects_path
		end
	end

	describe 'DELETE #destroy' do
		it "deletes the user" do
			expect{
				delete :destroy, user_id: user
			}.to change(User, :count).by(-1)
		end

		it "redirects to home page" do
			delete :destroy, user_id: user
			expect(response).to redirect_to root_url
		end
	end

	describe 'GET #edit' do
		it "renders the :edit template" do
			get :edit, user_id: user
			expect(response).to render_template :edit
		end
	end

	describe 'GET #show' do
		it "should return a 200 status code" do
			question_path, id="1"
			expect(response.status).to be(200)
		end
	end
end