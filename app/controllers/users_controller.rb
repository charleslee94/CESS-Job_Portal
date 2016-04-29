class UsersController < ApplicationController 
  def destroy
    @user = User.find(params[:id])
    Job.where(school: @user.school).each do |job|
      job.destroy
    end
    @user.destroy
    flash[:notice] = 'Successfully destroyed school.'
    redirect_to '/admin'
  end
end
