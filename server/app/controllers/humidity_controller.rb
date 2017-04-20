class HumidityController < ApplicationController
  before_action :validate_ids

  def index
    render json: Humidity.where(:parcel_id => @parcel.id)
  end

  def get
    render json: Humidity.find(params[:id])
  end

  def new
    render json: Humidity.create(humidity_params)
  end

  def update
    render json: Humidity.find(params[:id]).update(humidity_params)
  end

  def delete
    render json: Humidity.find(params[:id]).delete
  end

  private

  def validate_ids
    @parcel = Parcel.find params[:parcel_id]
    @field = Field.find params[:field_id]
    raise ActionController::RoutingError.new('Not Found'), 'parcel and field doesn\'t match' if @parcel.field != @field
  end

  def humidity_params
    authorized = params.permit(:longitude, :latitude, :value)
    authorized[:parcel_id] = @parcel.id
    authorized[:date] = DateTime.strptime(params[:date], '%s')
    authorized
  end
end
