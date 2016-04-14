require 'spec_helper'
require 'rspec/rails'
require 'rails_helper'
require 'factory_girl'

describe AdminpanelController do
  fixtures :jobs
  
  before(:each) do
    @job = jobs(:matt_job)
    @expired = jobs(:expired_job)
    candidate = User.create({:email => "haha@haha.com", :password => 'whatever222', :user_type => 'candidate'})
    school_user = User.create({:email => "haha@haha.com", :password => 'whatever222', :user_type => 'school'})
    admin_user = User.create({:email => "haha@haha.com", :password => 'whatever222', :user_type => 'admin'})
  end

end