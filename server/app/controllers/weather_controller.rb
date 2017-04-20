require 'open_weather'

class WeatherController < ApplicationController
  before_action :validate_ids, except: :create_all

  def index
    render :json => Weather.where(field_id: @field.id)
  end

  def get
    render :json => Weather.where(field_id: @field.id).find(params[:id])
  end

  def delete
    render :json => Weather.where(field_id: @field.id).find(params[:id]).destroy
  end

  def new
    render :json => save_weather(@field)
  end

  def lastest
    render :json => Weather.where(field_id: @field.id).last
  end

  def create_all
    Field.all.each do |field|
      save_weather field
    end
    render :nothing => true, :status => 204
  end

  private

  def validate_ids
    @field = Field.find(params[:field_id])
  end

  def save_weather(field)
    weather_api = OpenWeather::Current.geocode(field.latitude, field.longitude, {APPID: '8cfbefceedb3d7432103ae2fa283b9eb', lang: 'FR', units: 'metric'})
    Weather.create(description: weather_api['weather'][0]['description'],
                   temperature: weather_api['main']['temp'],
                   humidity: weather_api['main']['humidity'],
                   pressure: weather_api['main']['pressure'],
                   wind_speed: weather_api['wind']['speed'],
                   wind_dir: weather_api['wind']['deg'],
                   field_id: field.id)
  end
end
