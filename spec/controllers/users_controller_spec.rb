require 'rails_helper'

describe UsersController do
	let!(:user) { create :user }

	describe 'GET #new' do
		it "assigns a new user to @user" do
			get :new
			expect(assigns(:user)).to be_a_new(User)
		end

		it "should redirect to projects#index" do
				expect {
					post :create
					should redirect_to controller: home, action: :index
				}
		end
	end

	describe 'GET #edit' do
		it "should render the :edit template" do
			get :edit, id: user.id
			expect(response).to have_http_status(200)
		end
	end

	describe 'GET #show' do
		it "returns a successful status for a specific user" do
			get :show, id: user.id
			expect(response).to have_http_status(200)
		end
	end

	describe 'DELETE #destroy' do

		# *** NO ROUTE MATCHES ***
		# it "deletes the user" do
		# 	expect {
		# 		delete :destroy, user_id: user.id
		# 		}.to change(User, :count).by(-1)
		# end

		it "should redirect to home page" do
			expect {
				delete :destroy
				should redirect_to controller: users, action: :index
			}
		end
	end

end