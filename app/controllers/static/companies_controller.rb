class Static::CompaniesController < Static::MainController
  before_action :set_static_company, only: [:show, :edit, :update, :destroy]

  # GET /static/companies
  def index
    @companies = Company.all
  end

  # GET /static/companies/1
  def show
  end

  # GET /static/companies/new
  def new
    @company = Company.new
  end

  # GET /static/companies/1/edit
  def edit
  end

  # POST /static/companies
  def create
    @company = Company.new(static_company_params)

    if @company.save
      redirect_to @company, notice: 'Company was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /static/companies/1
  def update
    if @company.update(static_company_params)
      redirect_to @company, notice: 'Company was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /static/companies/1
  def destroy
    @company.destroy
    redirect_to static_companies_url, notice: 'Company was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_static_company
      @company = Company.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def static_company_params
      params.require(:static_company).permit(:name, :url)
    end
end
