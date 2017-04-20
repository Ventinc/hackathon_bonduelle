class FieldController < ApplicationController
  def index
    render :json => Field.all, :methods => :parcels
  end

  def get
    render :json => Field.find(params[:id]), :methods => :parcels
  end

  def new
    render :json => Field.create(field_params)
  end

  def update
    render :json => Field.find(params[:id]).update(field_params)
  end

  def delete
    render :json => Field.find(params[:id]).destroy
  end

  private
  def field_params
    params.permit(:longitude, :latitude, :name)
  end
end
