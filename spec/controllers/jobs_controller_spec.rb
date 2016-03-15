require 'spec_helper'
require 'rspec/rails'
require 'rails_helper'
require 'factory_girl'

describe JobsController do
  fixtures :jobs
  
  describe 'index should display all jobs' do
    it 'should call all jobs' do
        Job.should_receive(:all)
        get :index
    end
  end
  
  describe 'rendering correct pages' do
    it 'edit should call upon the correct id' do
        #job = FactoryGirl.build(:job, :school => 'Matt', :title => 'Nate', :summary => 'Not Good', :expiration => '2016-10-22')
        matt_job = jobs(:matt_job)
        Job.should_receive(:find).with(matt_job.id.to_s)
        get :edit, :id => matt_job.id
    end
    
    it 'edit should render the edit page' do
        #job = FactoryGirl.build(:job, :school => 'Matt', :title => 'Nate', :summary => 'Not Good', :expiration => '2016-10-22')
        matt_job = jobs(:matt_job)
        get :edit, :id => matt_job.id
        response.should render_template("edit")
    end
    
    it 'edit should render the show page' do
        #job = FactoryGirl.build(:job, :school => 'Matt', :title => 'Nate', :summary => 'Not Good', :expiration => '2016-10-22')
        matt_job = jobs(:matt_job)
        get :show, :id => matt_job.id
        response.should render_template("show")
    end
  end
  
  describe 'load the correct variables into view' do
    it 'should load correct job id into apply view' do
      matt_job = jobs(:matt_job)
      get :apply, :id => matt_job.id
      actual_job = Job.find(matt_job.id)
      assigns(:job).should == actual_job
    end
    
    it 'should load correct job id into edit view' do
      matt_job = jobs(:matt_job)
      delete :destroy, :id => matt_job.id
      actual_job = Job.find(matt_job.id)
      assigns(:job).should == actual_job
    end
  end
  
end