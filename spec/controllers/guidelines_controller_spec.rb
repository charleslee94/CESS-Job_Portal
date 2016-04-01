require 'spec_helper'
require 'rspec/rails'
require 'rails_helper'
require 'factory_girl'

describe GuidelinesController do
  fixtures :jobs
  
  describe 'rendering correct pages' do
    it 'edit should render the show page' do
        #job = FactoryGirl.build(:job, :school => 'Matt', :title => 'Nate', :summary => 'Not Good', :exipiration => '2016-10-22')
        matt_job = jobs(:matt_job)
        get :index, :id => matt_job.id
        response.should render_template("index")
    end
  end
  
end