module CrudHelper
  def show
    respond_with self.Model.find(params[:id])
  end

  def index
    respond_with self.Model.all
  end

  def create
    model = self.Model.new(model_params)
    if model.save
      render json: model, status: 200, location: [:api, model]
    else
      render json: { errors: model.errors }, status: 422
    end
  end

  def update
    model = self.Model.find(params[:id])
    if model.update(model_params)
      render json: model, status: 200, location: [:api, model]
    else
      render json: { errors: model.errors }, status: 422
    end
  end

  def destroy
    model = self.Model.find(params[:id])
    model.destroy
    head 204
  end

  private
  def model_params
    raise "Needs to be defined in subclass"
  end
end
