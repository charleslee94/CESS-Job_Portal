require 'spec_helper'
require 'rspec/rails'
require 'rails_helper'
require 'factory_girl'

describe JobsController do
  fixtures :jobs
  
  before(:each) do
    @job = jobs(:matt_job)
    @expired = jobs(:expired_job)
  end
  
  describe 'index should display all jobs' do
    it 'should call all jobs' do
        candidate = User.create({:email => "haha@haha.com", :password => 'whatever222', :user_type => 'school'})
        sign_in candidate
        get :index, :sort => 'compensation_max'
        session[:sort].should == 'compensation_max'
    end
    
     it 'should not sort be nil candidate' do
        candidate = User.create({:email => "haha@haha.com", :password => 'whatever222', :user_type => 'candidate'})
        sign_in candidate
        Job.should_receive(:order)
        get :index, nil, :sort => 'compensation_max'
    end
    
    it 'should call all jobs params' do
        candidate = User.create({:email => "haha@haha.com", :password => 'whatever222', :user_type => 'candidate'})
        sign_in candidate
        get :index, :sort => 'compensation_max'
        session[:sort].should == 'compensation_max'
    end
    
  end
  
  describe "POST #create" do
    it "create happy path" do
      Job.should_receive(:new).and_return(@job)
      candidate = User.create({:email => "haha@haha.com", :password => 'whatever222', :user_type => 'school'})
      sign_in candidate
      post :create, :job => {:school => @job.school, :title => @job.title, :job_description => @job.job_description, :fte => @job.fte, :compensation_min => @job.compensation_min, :compensation_max => @job.compensation_max, :expiration => @job.expiration}
      flash[:notice].should =~ /Job was created successfully/
    end
  end
  
  describe 'testing jobs#new' do
    it 'must be a candidate' do
      @user = User.create({:email => "haha@haha.com", :password => 'whatever222', :user_type => 'candidate'})
      #controller.stub(:current_user) { candidate } # re-upload
      sign_in @user
      get :new
      flash[:notice].should =~ /You must be a school to do this/
    end
    
    it 'must be logged in' do
      candidate = User.create({:email => "haha@haha.com", :password => 'whatever222', :user_type => 'school'})
      sign_in nil
      get :new
      flash[:notice].should =~ /You must be logged in to do this/
    end
  end
  
  describe 'testing GET static_school_info' do
    it '@save path works' do
      @user = User.create({:email => "haha@haha.com", :password => 'whatever222', :user_type => 'candidate'})
      sign_in @user
      get :static_school_info, :user => {:address => 'nowhere'}
      flash[:notice].should =~ /You have successfully/
    end
  end
  
  #should be working
  
  describe 'DELETE jobs#destroy' do
    it 'should delete a job' do
      candidate = User.create({:email => "haha@haha.com", :password => 'whatever222', :user_type => 'school'})
      sign_in candidate
      delete :destroy, :id => @job.id
      flash[:notice].should =~ /Job was successfully destroyed/
    end
    
    it 'should also destroy all resumes' do
      candidate = User.create({:email => "haha@haha.com", :password => 'whatever222', :user_type => 'school'})
      sign_in candidate
      attachment = File.new("#{Rails.root}/public/422.html")
      @resume = Resume.new({:firstname => 'Matt', :lastname => 'Joseph', :attachment => attachment})
      @job.resumes << @resume
      Resume.should_receive(:destroy)
      delete :destroy, :id => @job.id
      flash[:notice].should =~ /Job was successfully destroyed/
    end
    
    it 'should also have a sad path' do
      sign_in nil
      delete :destroy, :id => @job.id
      flash[:notice].should =~ /You must be logged in/
    end
  end

  describe 'PATCH jobs#update' do
    it 'should update a job' do
      candidate = User.create({:email => "haha@haha.com", :password => 'whatever222', :user_type => 'school'})
      sign_in candidate
      patch :update, :id => @job.id, :job => {:school => @job.school, :title => @job.title, :job_description => @job.job_description, :fte => @job.fte, :compensation_min => @job.compensation_min, :compensation_max => @job.compensation_max, :expiration => @job.expiration}
      flash[:notice].should =~ /Job was successfully updated/
    end
    
    it 'should update job sad path' do 
      candidate = User.create({:email => "haha@haha.com", :password => 'whatever222', :user_type => 'school'})
      sign_in nil
      patch :update, :id => @job.id, :job => {:school => @job.school, :title => @job.title, :job_description => @job.job_description, :fte => @job.fte, :compensation_min => @job.compensation_min, :compensation_max => @job.compensation_max, :expiration => @job.expiration}
      flash[:notice].should =~ /You must be logged in to do this/
    end
    
  end
  
  describe 'rendering correct pages' do
    it 'edit should call upon the correct id' do
        #job = FactoryGirl.build(:job, :school => 'Matt', :title => 'Nate', :summary => 'Not Good', :expiration => '2016-10-22')
        candidate = User.create({:email => "haha@haha.com", :password => 'whatever222', :user_type => 'school'})
        sign_in candidate
        get :edit, :id => @job.id
        expect(response).to have_http_status(:success)
        assigns(:job).should == @job
    end
    
    it 'edit sad path for not candidate' do
        candidate = User.create({:email => "haha@haha.com", :password => 'whatever222', :user_type => 'candidate'})
        sign_in candidate
        get :edit, :id => @job.id
        flash[:notice].should =~ /You must be a school to do this/
    end
    
    it 'edit sad path for logged ine' do
        candidate = User.create({:email => "haha@haha.com", :password => 'whatever222', :user_type => 'school'})
        sign_in nil
        get :edit, :id => @job.id
        flash[:notice].should =~ /You must be logged in to do this/
    end
    
    it 'edit should render the edit page' do
        #job = FactoryGirl.build(:job, :school => 'Matt', :title => 'Nate', :summary => 'Not Good', :expiration => '2016-10-22')
        candidate = User.create({:email => "haha@haha.com", :password => 'whatever222', :user_type => 'school'})
        sign_in candidate
        get :edit, :id => @job.id
        response.should render_template("edit")
    end
    
    it 'edit should render the show page' do
        #job = FactoryGirl.build(:job, :school => 'Matt', :title => 'Nate', :summary => 'Not Good', :expiration => '2016-10-22')
        school = User.create({:email => "haha@haha.com", :password => 'whatever222', :user_type => 'school'})
        User.should_receive(:where).and_return([school])
        get :show, :id => @job.id
        response.should render_template("show")
    end
  end
  
end