class AdminpanelController < ApplicationController
    def index
        if current_user
            if not current_user.user_type == 'admin'
                flash[:notice] = 'You are not authorized to view this page'
                redirect_to '/jobs'
            end
        else
            redirect_to '/jobs'
        end
    end
    
    def newschool
        @user = User.new
    end
    
    def create_new_school
      @user = User.create(email: params[:user][:email], school: params[:user][:school], password: params[:user][:password], user_type: 'school')
      redirect_to '/admin'
    end
    
end
