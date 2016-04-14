class AdminpanelController < ApplicationController
    def index
        if not current_user.user_type == 'admin'
            flash[:notice] = 'You are not authorized to view this page'
            redirect_to '/jobs'
        end
    end
    
    def newschool
        @user = User.new
    end
    
    def create_new_school
      redirect_to '/admin'
    end


end
