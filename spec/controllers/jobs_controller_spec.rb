require 'spec_helper'
require 'rspec/rails'
require 'rails_helper'
require 'factory_girl'

describe JobsController do
  fixtures :jobs
  
  before(:each) do
    @job = jobs(:matt_job)
    @expired = jobs(:expired_job)
    candidate = User.create({:email => "haha@haha.com", :password => 'whatever222', :user_type => 'candidate'})
    school_user = User.create({:email => "haha@haha.com", :password => 'whatever222', :user_type => 'school'})
    admin_user = User.create({:email => "haha@haha.com", :password => 'whatever222', :user_type => 'admin'})
  end
  
  describe 'index should display all jobs' do
    it 'should call all jobs' do
        Job.should_receive(:order)
        get :index, :sort => 'compensation_max'
    end
    
    it 'should call all jobs' do
        Job.should_receive(:select)
        get :index, :show => 'compensation_max'
    end
  end
  
  describe "POST #create" do
    it "create happy path" do
      Job.should_receive(:new).and_return(@job)
      candidate = User.create({:email => "haha@haha.com", :password => 'whatever222', :user_type => 'candidate'})
      controller.should_receive(:current_user).and_return(candidate)
      post :create, :job => {:school => @job.school, :title => @job.title, :job_description => @job.job_description, :fte => @job.fte, :compensation_min => @job.compensation_min, :compensation_max => @job.compensation_max, :expiration => @job.expiration}
      flash[:notice].should =~ /Job was created successfully/
    end
    
    it "expired sad path" do
      Job.should_receive(:new).and_return(@expired)
      post :create, :job => {:school => @job.school, :title => @job.title, :job_description => @job.job_description, :fte => @job.fte, :compensation_min => @job.compensation_min, :compensation_max => @job.compensation_max, :expiration => @expired.expiration}
    end
  end
  
  describe 'testing jobs#new' do
    it 'should call a new job' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  
  describe 'DELETE jobs#destroy' do
    it 'should delete a job' do
      delete :destroy, :id => @job.id
      flash[:notice].should =~ /Job was successfully destroyed/
    end
  end

  describe 'PATCH jobs#update' do
    it 'should update a job' do
      patch :update, :id => @job.id, :job => {:school => @job.school, :title => @job.title, :job_description => @job.job_description, :fte => @job.fte, :compensation_min => @job.compensation_min, :compensation_max => @job.compensation_max, :expiration => @job.expiration}
      flash[:notice].should =~ /Job was successfully updated/
    end
  end
  
  describe 'rendering correct pages' do
    it 'edit should call upon the correct id' do
        #job = FactoryGirl.build(:job, :school => 'Matt', :title => 'Nate', :summary => 'Not Good', :expiration => '2016-10-22')
        get :edit, :id => @job.id
        expect(response).to have_http_status(:success)
        assigns(:job).should == @job
    end
    
    it 'edit should render the edit page' do
        #job = FactoryGirl.build(:job, :school => 'Matt', :title => 'Nate', :summary => 'Not Good', :expiration => '2016-10-22')
        get :edit, :id => @job.id
        response.should render_template("edit")
    end
    
    it 'edit should render the show page' do
        #job = FactoryGirl.build(:job, :school => 'Matt', :title => 'Nate', :summary => 'Not Good', :expiration => '2016-10-22')
        get :show, :id => @job.id
        response.should render_template("show")
    end
  end
  
end