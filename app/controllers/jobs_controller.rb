class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  # GET /jobs
  # GET /jobs.json
  def index
    #@jobs = Job.all
    sort = params[:sort]
    show = params[:show]
    unless show.nil?
      @jobs = Job.select(show)
    end
    if sort
      @jobs = Job.order(sort + ' ASC')
    else
      @jobs = Job.all
    end
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
    @job = Job.new
    #else
      #flash[:notice] = "You don't have permission to add a job post."
      #render action: 'index'
    #end
  end

  # GET /jobs/1/edit
  def edit
    @job = Job.find(params[:id])
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)
    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
      # to-do: add fail cases for creation!
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      end
      #TO-DO: add fail cases for creation! 
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:school, :title, :summary, :compensation_min, :compensation_max, :exipiration)
    end
end
