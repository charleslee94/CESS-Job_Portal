class ResumesController < ApplicationController
   # before_action :verify_admin, only: [:view]
   def index
      @resumes = Resume.all
      if current_user and current_user.user_type == 'school'
         school = User.find(params[:schoolid]) 
         @resumes = []
         school.jobs.each do |job|
            Resume.where(:job_id => job.id).each do |each_resume|
               @resumes << each_resume
            end
         end
      else
         flash[:notice] = "You must be logged in as a school administrator to view this page"
         redirect_to '/jobs'
      end
      return @resumes
   end
   
   def new
      if current_user
         @job = Job.find(params[:jobid])
         @resume = Resume.new
      else
         #make this notice show up on log in page NOT job description page
         flash[:notice] = "You must be logged in to submit a resume."
         redirect_to new_user_session_path
      end
   end
   
   def create
      @job = Job.find(params[:jobid])
      @resume = Resume.new(resume_params)
      @job.resumes << @resume
      if @resume.save
         redirect_to jobs_path, notice: "The resume #{@resume.attachment} has been uploaded. You have successfully applied to #{@job.title}."
      else
         redirect_to new_app_path(@job), notice: "The upload failed as you have either not included a file name, have not attached a file, or the file is the wrong filetype (allowed filetypes: .PDF, .DOC, .DOCX)"
      end
   end
   
   private
      def resume_params
        params.require(:resume).permit(:firstname, :lastname, :attachment)
      end
end