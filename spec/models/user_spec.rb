require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user should be created successfully' do
    it 'should call all jobs' do
        @user = User.create!({:email => 'l8@l8.com', :password => 'l8l8l8l8l8l8', :encrypted_password => 'lame'})
        @user.email.should == 'l8@l8.com'
    end
  end
end
