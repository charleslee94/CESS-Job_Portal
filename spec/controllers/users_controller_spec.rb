require 'spec_helper'
require 'rspec/rails'
require 'rails_helper'
require 'factory_girl'

describe UsersController do
  fixtures :jobs
  
  before(:each) do
    @job = jobs(:matt_job)
    @expired = jobs(:expired_job)
  end
  
  describe 'DELETE jobs#destroy' do
    it 'should delete a job' do
      candidate = User.create({:email => "haha@haha.com", :password => 'whatever222', :user_type => 'school'})
      sign_in candidate
      delete :destroy, :id => @job.id
      flash[:notice].should =~ /destroyed school/
    end
  end
end