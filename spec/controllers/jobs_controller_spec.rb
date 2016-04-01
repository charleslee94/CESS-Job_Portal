require 'spec_helper'
require 'rspec/rails'
require 'rails_helper'
require 'factory_girl'

describe JobsController do
  fixtures :jobs
  
  before(:each) do
    @job = jobs(:matt_job)
  end
  
  describe 'index should display all jobs' do
    it 'should call all jobs' do
        Job.should_receive(:all)
        get :index
    end
  end
  
  describe "POST #create" do
    it "create happy path" do
      Job.should_receive(:new).and_return(@job)
      post :create, :job => {:school => @job.school, :title => @job.title, :summary => @job.summary, :compensation_min => @job.compensation_min, :compensation_max => @job.compensation_max, :expiration => @job.exipiration}
      flash[:notice].should =~ /Job was successfully created/
    end
  end
  
  describe 'testing jobs#new' do
    it 'should call a new job' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  
  
  describe 'rendering correct pages' do
    it 'edit should call upon the correct id' do
        #job = FactoryGirl.build(:job, :school => 'Matt', :title => 'Nate', :summary => 'Not Good', :exipiration => '2016-10-22')
        Job.should_receive(:find).with(@job.id.to_s)
        get :edit, :id => @job.id
    end
    
    it 'edit should render the edit page' do
        #job = FactoryGirl.build(:job, :school => 'Matt', :title => 'Nate', :summary => 'Not Good', :exipiration => '2016-10-22')
        get :edit, :id => @job.id
        response.should render_template("edit")
    end
    
    it 'edit should render the show page' do
        #job = FactoryGirl.build(:job, :school => 'Matt', :title => 'Nate', :summary => 'Not Good', :exipiration => '2016-10-22')
        get :show, :id => @job.id
        response.should render_template("show")
    end
  end
  
end