require 'spec_helper'
require 'rspec/rails'
require 'rails_helper'
require 'factory_girl'

describe AdminpanelController do
  fixtures :jobs
  
  before(:each) do
    @job = jobs(:matt_job)
  end
  
  describe "GET #index" do
        it "index sad path 1" do
            controller.stub(:current_user) { nil }
            get :index
            flash[:notice].should =~ /You must be logged in to view this page/
        end
    
        it "index sad path 2" do
            candidate = User.create!({:email => "hah2a@haha.com", :password => 'whatever222', :user_type => 'candidate'})
            candidate.jobs << @job
            controller.stub(:current_user) { candidate }
            get :index
            flash[:notice].should =~ /authorized to view this page/
        end
  end
  
   describe "POST #create_new_school" do
    it 'create happy path' do
        post :create_new_school, :user => {:email => "hah2a@haha.com", :password => 'whatever222', :school => 'hard knocks'}
        flash[:notice].should =~ /successfully/
    end
   end
  
    describe "GET change_school_password" do
     it 'change happy path' do
         candidate = User.create!({:email => "hah2a@haha.com", :password => 'whatever222', :user_type => 'candidate'})
         get :change_school_password, :user => {:password => "hahahahaa"}, :id => candidate.id
         flash[:notice].should =~ /successfully/
     end
    end 
end