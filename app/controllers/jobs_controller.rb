class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]

  # GET /jobs
  # GET /jobs.json
  def index
    sort = params[:sort]
    show = params[:show]
    if current_user and current_user.user_type == 'school'
      if sort
        @jobs = Job.order(sort + ' ASC').where("school = ?", current_user.school)
        session[:sort] = sort
      elsif (session[:sort] != nil)
        sort = session[:sort]  
        @jobs = Job.order(sort + ' ASC').where("school = ?", current_user.school)
      else 
        @jobs = Job.where("school = ?", current_user.school)
      end
      
    else
      if sort
        @jobs = Job.order(sort + ' ASC')
        session[:sort] = sort
      elsif (session[:sort] != nil)
        sort = session[:sort]  
        @jobs = Job.order(sort + ' ASC')
      else 
        @jobs = Job.all
      end
    end
  end
  
  def admin_panel
  end
  
  def homepage
  end
  
  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @job = Job.find(params[:id])
  end

  # GET /jobs/new
  #authentication here for posting new job
  def new
    #if current_user
    if current_user
      if current_user.user_type == "school"
        @job = Job.new
      else
        flash[:notice] = 'You must be a school to do this'
        redirect_to '/jobs'
      end
    else
      flash[:notice] = 'You must be logged in to do this'
      redirect_to '/jobs'
    end
    #else
      #flash[:notice] = "You don't have permission to add a job post."
      #render action: 'index'
    #end
  end

  # GET /jobs/1/edit
  def edit
    if current_user
      if current_user.user_type != "candidate"
        @job = Job.find(params[:id])
      else
        flash[:notice] = 'You must be a school to do this'
        redirect_to '/jobs'
      end
    else
      flash[:notice] = 'You must be logged in to do this'
      redirect_to '/jobs'
    end
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)
    respond_to do |format|
      if @job.save
        @job.school = current_user.school
        current_user.jobs << @job
        format.html { redirect_to @job, notice: 'Job was created successfully' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new, notice: 'Job was not created successfully' }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    if current_user
      respond_to do |format|
        if @job.update(job_params)
          format.html { redirect_to @job, notice: 'Job was successfully updated.' }
          format.json { render :show, status: :ok, location: @job }
        end
        #TO-DO: add fail cases for creation! 
      end
    else
      flash[:notice] = 'You must be logged in to do this'
      redirect_to '/jobs'
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    if current_user
      if @job.resumes
        @job.resumes.each do |resume|
          Resume.destroy(resume)
        end
      end
      @job.destroy
      respond_to do |format|
        format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      flash[:notice] = 'You must be logged in to do this'
      redirect_to '/jobs'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:school, :title, :job_description, :fte, :compensation_min, :compensation_max, :expiration)
    end
end
