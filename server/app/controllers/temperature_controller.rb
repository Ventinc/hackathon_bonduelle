class TemperatureController < ApplicationController
  before_action :validate_ids

  def index
    render json: Temperature.where(parcel_id: @parcel.id)
  end

  def get
    render json: Temperature.where(parcel_id: @parcel.id).find(params[:id])
  end

  def new
    render json: Temperature.create(temperature_params)
  end

  def update
    render json: Temperature.where(parcel_id: @parcel.id).find(params[:id]).update(temperature_params)
  end

  def delete
    render json: Temperature.where(parcel_id: @parcel.id).find(params[:id]).delete
  end

  private

  def validate_ids
    @field = Field.find params[:field_id]
    @parcel = Parcel.where(field_id: @field.id).find(params[:parcel_id])
  end

  def temperature_params
    authorized = params.permit(:longitude, :latitude, :value)
    authorized[:parcel_id] = @parcel.id
    if params.key?(:date)
      authorized[:date] = DateTime.strptime(params[:date], '%s')
    end
    authorized
  end
end
