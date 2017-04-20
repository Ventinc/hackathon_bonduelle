class ParcelController < ApplicationController
  before_action :validate_ids

  def index
    render :json => Parcel.all, :methods => :humidities
  end

  def get
    render :json => Parcel.find(params[:id]), :methods => :humidities
  end

  def new
    render :json => Parcel.create(parcel_params)
  end

  def update
    render :json => Parcel.find(params[:id]).update(parcel_params)
  end

  def delete
    render :json => Parcel.find(params[:id]).destroy
  end

  private

  def parcel_params
    authorized = params.permit(:longitude, :latitude)
    authorized[:field_id] = @field.id
    authorized
  end

  def validate_ids
    @field = Field.find(params[:field_id])
  end
end
