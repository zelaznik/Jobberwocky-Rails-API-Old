class Static::StatusesController < Static::MainController
  before_action :set_status, only: [:show, :edit, :update, :destroy]

  # GET /static/statuses
  def index
    @statuses = Status.all
  end

  # GET /static/statuses/1
  def show
  end

  # GET /static/statuses/new
  def new
    @status = Status.new
  end

  # GET /static/statuses/1/edit
  def edit
  end

  # POST /static/statuses
  def create
    @status = Status.new(status_params)

    if @status.save
      redirect_to @status, notice: 'Status was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /static/statuses/1
  def update
    if @status.update(status_params)
      redirect_to @status, notice: 'Status was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /static/statuses/1
  def destroy
    @status.destroy
    redirect_to statuses_url, notice: 'Status was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status
      @status = Status.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def status_params
      params.require(:status).permit(:label)
    end
end
