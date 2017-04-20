class CropController < ApplicationController
  before_action :validate_ids

  def index
    render :json => Crop.where(field_id: @field.id).all
  end

  def get
    render :json => Crop.where(field_id: @field.id).find(params[:id])
  end

  def new
    render :json => Crop.create(crop_params)
  end

  def update
    render :json => Crop.where(field_id: @field.id).find(params[:id]).update(crop_params)
  end

  def delete
    render :json => Crop.where(field_id: @field.id).find(params[:id]).destroy
  end

  def lastest
    render :json => Crop.where(field_id: @field.id).last
  end

  private

  def validate_ids
    @field = Field.find(params[:field_id])
  end

  def crop_params
    authorized = params.permit(:name, :quantity)
    if params.key?(:date_harvest)
      authorized[:harvest] = DateTime.strptime(params[:date_harvest], '%s')
    end
    authorized[:field_id] = @field.id
    authorized
  end
end
