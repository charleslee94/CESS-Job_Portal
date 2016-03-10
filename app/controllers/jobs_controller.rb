class JobsController < ApplicationController
  
  def job_params
    
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @job = Job.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    
  end

  def new
    # default: render 'new' template
  end

  def create
    @job = Job.create!(job_params)
    flash[:notice] = "#{@job.title} was successfully created."
    redirect_to jobs_path
  end

  def edit
    @job = Job.find params[:id]
  end

  def update
    @job = Movie.find params[:id]
    @job.update_attributes!(job_params)
    flash[:notice] = "#{@job.title} was successfully updated."
    redirect_to job_path(@job)
  end

  def destroy
    @job = Movie.find(params[:id])
    @job.destroy
    flash[:notice] = "Job Posting '#{@job.title}' deleted."
    redirect_to jobs_path
  end

end
