require 'rails_helper'

describe ProjectsController do
  let!(:project) { create :project }

  describe 'GET #index' do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "says 'SOMETHING FROM THE PAGE GOES HERE' " do
      get :index
      expect(response.body).to match(/SOMETHING FROM/im)
      # Line above from: https://www.relishapp.com/rspec/rspec-rails/v/3-1/docs/controller-specs/render-views - see that page to finish off this test
    end
  end

  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context "with valid attributes" do
      it "saves a new project in the database" do
        expect{
            post :create, project: attributes_for(:project)
            }.to change(Project, :count).by(1)
      end

      it "redirects to #index" do
        post :create, project: attributes_for(:project)
          expect(response).to redirect_to user_projects_path(assigns[:project])
      end
    end
  end

  describe 'GET #show' do
    it "has a 200 status code" do
      get :show
      expect(response.status).to eq(200)
    end

    it "says 'SOMETHING FROM THE PAGE GOES HERE' " do
      get :show
      expect(response.body).to match(/SOMETHING FROM/im)
      # Line above from: https://www.relishapp.com/rspec/rspec-rails/v/3-1/docs/controller-specs/render-views - see that page to finish off this test
    end
  end

  describe "DELETE #destroy" do
    it "deletes the project" do
      expect{
        delete :destory, project_id: project
      }.to change(Project, :count).by(-1)
    end

    it "redirects to #index" do
      delete :destroy, project_id: project
      expect(response).to redirect_to user_projects_path
    end
  end

  describe "GET #edit" do
    it "renders the :edit template" do
      get :edit, project_id: project
      expect(response).to render_template :edit
    end
  end

  describe "PUT #update" do
    it "changes project's attributes" do
      put :update, project_id: project,
        project: attributes_for(:project, title: "Not A Great Novel", current_wordcount: 500)
        expect(project.title).to eq("Not A Great Novel")
        expect(current_wordcount).to eq(500)
    end
  end

  describe "DELETE #destroy" do
    it "deletes the project" do
      expect{
        delete :destory, project_id: project
      }.to change(Project, :count).by(-1)
    end

    it "redirects to #index" do
      delete :destroy, project_id: project
      expect(response).to redirect_to user_projects_path
    end
  end

end
