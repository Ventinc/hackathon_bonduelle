class LuminosityController < ApplicationController
  before_action :validate_ids

  def index
    render json: Luminosity.where(parcel_id: @parcel.id)
  end

  def get
    render json: Luminosity.where(parcel_id: @parcel.id).find(params[:id])
  end

  def new
    render json: Luminosity.create(luminosity_params)
  end

  def update
    render json: Luminosity.where(parcel_id: @parcel.id).find(params[:id]).update(luminosity_params)
  end

  def delete
    render json: Luminosity.where(parcel_id: @parcel.id).find(params[:id]).delete
  end

  private

  def validate_ids
    @field = Field.find params[:field_id]
    @parcel = Parcel.where(field_id: @field.id).find(params[:parcel_id])
  end

  def luminosity_params
    authorized = params.permit(:longitude, :latitude, :value)
    authorized[:parcel_id] = @parcel.id
    if params.key?(:date)
      authorized[:date] = DateTime.strptime(params[:date], '%s')
    end
    authorized
  end
end
