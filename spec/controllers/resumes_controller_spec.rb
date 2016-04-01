require 'spec_helper'
require 'rspec/rails'
require 'rails_helper'
require 'factory_girl'

RSpec.describe ResumesController, type: :controller do
  fixtures :jobs
  
  before(:each) do
    @job = jobs(:matt_job)
  end
  
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "POST #create" do
    it "create happy path" do
      attachment = File.new("#{Rails.root}/public/422.html")
      matt_job = jobs(:matt_job)
      resume = Resume.new({:name => 'Joseph, Fire', :attachment => attachment})
      Resume.should_receive(:new).and_return(resume)
      Job.should_receive(:find).and_return(@job)
      post :create, :jobid => @job.id, :resume => {:name => 'Joseph, Fire', :attachment => attachment}
      flash[:notice].should =~ /has been uploaded/
    end
    
    it "create sad path" do
      attachment = File.new("#{Rails.root}/public/robots.txt")
      matt_job = jobs(:matt_job)
      resume = Resume.new({:name => 'Joseph, Fire', :attachment => attachment})
      Resume.should_receive(:new).and_return(resume)
      Job.should_receive(:find).and_return(@job)
      post :create, :jobid => @job.id, :resume => {:name => 'Joseph, Fire', :attachment => attachment}
      flash[:notice].should =~ /The upload failed/
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
