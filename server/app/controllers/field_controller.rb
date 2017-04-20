class FieldController < ApplicationController
  def index
    render :json => Field.all
  end

  def get
    render :json => Field.find(params[:id])
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
