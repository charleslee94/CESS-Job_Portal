class ResumesController < ApplicationController
   def index
      @resumes = Resume.all
   end
   
   def new
      @job = Job.find(params[:jobid])
      @resume = Resume.new
   end
   
   def create
      @job = Job.find(params[:jobid])
      @resume = Resume.new(resume_params)
      @job.resumes << @resume
      if @resume.save
         redirect_to jobs_path, notice: "The resume #{@resume.name} has been uploaded. You have successfully applied to #{@job.title}."
      else
         redirect_to new_app_path(@job), notice: "The upload failed as you have either not included a file name, have not attached a file, or the file is the wrong filetype (allowed filetypes: .PDF, .DOC, .DOCX)"
      end
   end
   
   def destroy
   end
   
   private
      def resume_params
        params.require(:resume).permit(:name, :attachment)
      end
end