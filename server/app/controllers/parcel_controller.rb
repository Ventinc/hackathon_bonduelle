class ParcelController < ApplicationController
  before_action :validate_ids

  def index
    render :json => Parcel.where(field_id: @field.id)
  end

  def get
    render :json => Parcel.where(field_id: @field.id).find(params[:id]), methods: :datas
  end

  def new
    render :json => Parcel.create(parcel_params)
  end

  def update
    render :json => Parcel.where(field_id: @field.id).find(params[:id]).update(parcel_params)
  end

  def delete
    render :json => Parcel.where(field_id: @field.id).find(params[:id]).destroy
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
