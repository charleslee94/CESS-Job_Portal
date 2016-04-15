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
    it "index happy path" do
      attachment = File.new("#{Rails.root}/public/422.html")
      @job = jobs(:matt_job)
      @resume = Resume.new({:firstname => 'Matt', :lastname => 'Joseph', :attachment => attachment})
      @job.resumes << @resume
      candidate = User.create!({:email => "hah2a@haha.com", :password => 'whatever222', :user_type => 'school'})
      candidate.jobs << @job
      controller.stub(:current_user) { candidate } # re-upload
      get :index, :schoolid => candidate.id
      assigns(@resumes).should == {"marked_for_same_origin_verification" => true, "resumes" => [@resume]}
    end
    
    it "index sad" do
      attachment = File.new("#{Rails.root}/public/422.html")
      @job = jobs(:matt_job)
      @resume = Resume.new({:firstname => 'Matt', :lastname => 'Joseph', :attachment => attachment})
      @job.resumes << @resume
      candidate = User.create!({:email => "hah2a@haha.com", :password => 'whatever222', :user_type => 'candidate'})
      candidate.jobs << @job
      controller.stub(:current_user) { candidate }
      get :index, :schoolid => candidate.id
      flash[:notice].should =~ /administrator to view this page/
    end
  end
  
  describe "POST #create" do
    it "create happy path" do
      attachment = File.new("#{Rails.root}/public/422.html")
      matt_job = jobs(:matt_job)
      @resume = Resume.new({:firstname => 'Matt', :lastname => 'Joseph', :attachment => attachment})
      Resume.should_receive(:new).and_return(@resume)
      Job.should_receive(:find).and_return(@job)
      post :create, :jobid => @job.id, :resume => {:name => 'Joseph, Fire', :attachment => attachment}
      flash[:notice].should =~ /Thank you for your submission/
    end
    
    it "create sad path" do
      attachment = File.new("#{Rails.root}/public/robots.txt")
      matt_job = jobs(:matt_job)
      @resume = Resume.new({:firstname => 'Matt', :lastname => 'Joseph', :attachment => attachment})
      Resume.should_receive(:new).and_return(@resume)
      Job.should_receive(:find).and_return(@job)
      post :create, :jobid => @job.id, :resume => {:name => 'Joseph, Fire', :attachment => attachment}
      flash[:notice].should =~ /The upload failed/
    end
  end

  describe "GET #new" do
    it "returns http success" do
      candidate = User.create({:email => "haha@haha.com", :password => 'whatever222', :user_type => 'school'})
      controller.should_receive(:current_user).and_return(candidate)
      get :new, :jobid => 1
      @job = Job.find(1)
      assigns(:job).should == @job 
      expect(response).to have_http_status(:success)
    end
    
    it "returns sad path" do
      controller.should_receive(:current_user).and_return(nil)
      get :new, :jobid => 1
      flash[:notice].should =~ /must be logged in/
    end
  end
  
end
