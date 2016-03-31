require 'spec_helper'
require 'rspec/rails'
require 'rails_helper'
require 'factory_girl'

RSpec.describe ResumesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, :jobid => 1
      @job = Job.find(1)
      assigns(:job).should == @job 
      expect(response).to have_http_status(:success)
    end
  end
  
end
