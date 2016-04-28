class UsersController < ApplicationController 
  def destroy
    @user = User.find(params[:id])
    Job.where(school: @user.school).each do |job|
      job.destroy
    end
    @user.destroy
    redirect_to '/admin'
  end
end
