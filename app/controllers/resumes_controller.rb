class ResumesController < ApplicationController
   def index
      @resumes = Resume.all
   end
   
   def new
      @job = Job.find(params[:jobid])
      @resume = Resume.new
   end
   
   def create
      @resume = Resume.new(resume_params)
      @job = Job.find(params[:jobid])
      @resume.jobid = @job.id
      if @resume.save
         redirect_to jobs_path, notice: "The resume #{@resume.name} has been uploaded. You have successfully applied to #{@job.title}."
      else
         redirect_to new_app_path(@job), notice: "The upload failed as you have either not included a file name or have not included a file."
      end
   end
   
   def destroy
      @resume = Resume.find(params[:id])
      @resume.destroy
      redirect_to jobs_path, notice:  "The resume #{@resume.name} has been deleted."
   end
   
   private
      def resume_params
        params.require(:resume).permit(:name, :attachment, :jobid)
      end
end