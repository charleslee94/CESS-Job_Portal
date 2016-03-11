require 'spec_helper'
require 'rspec/rails'
require 'rails_helper'

describe JobsController do
  describe 'index should display all jobs' do
    it 'should call all jobs' do
        Job.should_receive(:all)
        get :index
    end
  end
end