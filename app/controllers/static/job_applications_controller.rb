class Static::JobApplicationsController < ApplicationController
  before_action :set_job_application, only: [:show, :edit, :update, :destroy]

  # GET /static/job_applications
  def index
    @job_applications = JobApplication.all
  end

  # GET /static/job_applications/1
  def show
  end

  # GET /static/job_applications/new
  def new
    @job_application = JobApplication.new
  end

  # GET /static/job_applications/1/edit
  def edit
  end

  # POST /static/job_applications
  def create
    @job_application = JobApplication.new(job_application_params)

    if @job_application.save
      redirect_to static_job_applications_url(@job_application), notice: 'Job application was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /static/job_applications/1
  def update
    if @job_application.update(job_application_params)
      redirect_to @job_application, notice: 'Job application was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /static/job_applications/1
  def destroy
    @job_application.destroy
    redirect_to static_job_applications_url, notice: 'Job application was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_application
      @job_application = JobApplication.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def job_application_params
      params.require(:job_application).permit(:company_id, :user_id, :job_title, :url, :first_applied, :last_update, :status_id)
    end
end
