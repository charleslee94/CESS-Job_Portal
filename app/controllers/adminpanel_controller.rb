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
      @user = User.new(email: params[:user][:email], school: params[:user][:school], password: params[:user][:password], user_type: 'school', website: params[:user][:website])
      if @user.save 
          flash[:notice] = 'You have successfully created a new school. Log in to your school account to start posting job listings.'
          redirect_to '/jobs'
      else
          flash[:notice] = 'Something went wrong in the creation of this user.'
          redirect_to '/admin'
      end
    end
    
    
    def changepw(school)
        print "HI"
        @user = User.find_by(name: school.school)
        print "MEOW"
        print @user
        print "cats"
    end
    
    
    def change_school_password
        @user = User.find_by(email: params[:user][:email])
        @user.password = params[:user][:password]
        if @user.save 
          flash[:notice] = 'You have successfully updated the password.'
          redirect_to '/jobs'
      else
          flash[:notice] = 'Something went wrong when trying to change the password.'
          redirect_to '/admin'
      end   
    end
end
