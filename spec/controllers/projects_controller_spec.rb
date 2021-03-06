require 'spec_helper'

describe ProjectsController do
  let(:user) { create_user! }
  let(:project) { Factory(:project) }

  it "displays an error message when asked for a missing project" do
    get :show, :id => "not-here"
    response.should redirect_to(projects_path)
    flash[:alert].should eql("The project you were looking for could not be found.")
  end

  context "standard users" do
    it "cannot access the new action" do
      sign_in(:user, user)
      get :new
      response.should redirect_to(root_path)
      flash[:alert].should eql("You must be an admin to do that.")
    end
  end

  {"new" => "get", "create" => "post", "edit" => "get", "update" => "get", "destroy" => "delete" }.each do |action, method|
  it "cannot access the #{action} action" do
    sign_in(:user, user)
    send(method, action.dup, :id => project.id)
    response.should redirect_to(root_path)
    flash[:alert].should eql("You must be an admin to do that.")
  end
  end
end
