class AdminpanelController < ApplicationController
    def index
        if current_user
            if not current_user.user_type == 'admin'
                flash[:notice] = 'You are not authorized to view this page'
                redirect_to '/jobs'
            end
            @users = User.where(user_type: 'school') 
        else
            flash[:notice] = 'You must be logged in to view this page'
            redirect_to '/jobs'
        end
    end
    
    
    def newschool
        @user = User.new
    end
    
    
    def create_new_school
      if params[:user][:password].length >= 8
        @user = User.new(email: params[:user][:email], school: params[:user][:school], password: params[:user][:password], user_type: 'school')
        if @user.save 
          flash[:notice] = 'You have successfully created a new school. Log in to your school account to start posting job listings.'
          redirect_to '/jobs'
        else
          flash[:notice] = 'Something went wrong in the creation of this user.'
          redirect_to '/admin'
        end
      else
        flash[:notice] = 'Account not created! Password must be at least 8 characters in length.'
        redirect_to '/admin/newschool'
      end
    
    end
    
    
    
    def change_school_password
        @user = User.find(params[:id])
        @user.update(password: params[:user][:password])
        if @user.save 
          flash[:notice] = 'You have successfully updated the password.'
          redirect_to '/jobs'
        else
          flash[:notice] = 'Something went wrong when trying to change the password.'
          redirect_to '/admin'
      end   
    end
end
