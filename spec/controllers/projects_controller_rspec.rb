require "rails_helper"

RSpec.describe ProjectsController do
  describe "GET index" do
    it "assigns @projects" do
      project = Project.create
      get :index

      expect(assigns(:projects)).to eq([project])
    end

    it "renders index template" do
      get :index

      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    it "assigns @project" do
      project = Project.create
      get :show, params: { id: project.id }

      expect(assigns(:project)).to eq(project)
    end

    it "renders project show page" do
      project = Project.create
      get :show, params: { id: project.id }

      expect(response).to render_template("show")
    end
  end

  describe "POST create" do
    it "assigns @project" do
      post :create, params: { project:
                              { name: "Fix table",
                                description: "Table has 2 broken legs",
                                priority: 1.2
                              }
                            }
      project = Project.find_by(name: "Fix table")

      expect(Project.last).to eq(project)
    end

    it "redirects to index" do
      post :create, params: { project:
                              { name: "Fix table",
                                description: "Table has 2 broken legs",
                                priority: 1.2
                              }
                            }
      project = Project.find_by(name: "Fix table")

      expect(response).to redirect_to(projects_path)
    end
  end

  describe "DELETE destroy" do
    it "deletes @project" do
      project = Project.create(
                                name: "some name",
                                description: "some description",
                                priority: 1.4
                              )

      expect {
        delete :destroy, params: { id: project.id }
      }.to change(Project, :count).by(-1)
      expect(Project.exists?(project.id)).to be(false)
    end

    it "redirects to index" do
      project = Project.create(
        name: "some name",
        description: "some description",
        priority: 1.4
      )

      delete :destroy, params: { id: project.id }
      
      expect(response).to redirect_to(projects_path)
    end
  end
end
