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
  
  describe 'testing jobs#new' do
    it 'should call a new job' do
      get :new
    end
  end
  
  
  describe 'rendering correct pages' do
    it 'edit should call upon the correct id' do
        #job = FactoryGirl.build(:job, :school => 'Matt', :title => 'Nate', :summary => 'Not Good', :exipiration => '2016-10-22')
        matt_job = jobs(:matt_job)
        Job.should_receive(:find).with(matt_job.id.to_s)
        get :edit, :id => matt_job.id
    end
    
    it 'edit should render the edit page' do
        #job = FactoryGirl.build(:job, :school => 'Matt', :title => 'Nate', :summary => 'Not Good', :exipiration => '2016-10-22')
        matt_job = jobs(:matt_job)
        get :edit, :id => matt_job.id
        response.should render_template("edit")
    end
    
    it 'edit should render the show page' do
        #job = FactoryGirl.build(:job, :school => 'Matt', :title => 'Nate', :summary => 'Not Good', :exipiration => '2016-10-22')
        matt_job = jobs(:matt_job)
        get :show, :id => matt_job.id
        response.should render_template("show")
    end
  end
  
end