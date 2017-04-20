Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '/api' do
    scope '/v1' do
      get         '/fields'     => 'field#index'
      post        '/fields'     => 'field#new'
      get         '/field/:id'  => 'field#get'
      put         '/field/:id'  => 'field#update'
      delete      '/field/:id'  => 'field#delete'

      get         '/field/:field_id/parcels'    => 'parcel#index'
      post        '/field/:field_id/parcels'    => 'parcel#new'
      get         '/field/:field_id/parcel/:id' => 'parcel#get'
      put         '/field/:field_id/parcel/:id' => 'parcel#update'
      delete      '/field/:field_id/parcel/:id' => 'parcel#delete'

      get         '/field/:field_id/parcel/:parcel_id/humidities'   => 'humidity#index'
      post        '/field/:field_id/parcel/:parcel_id/humidities'   => 'humidity#new'
      get         '/field/:field_id/parcel/:parcel_id/humidity/:id' => 'humidity#get'
      put         '/field/:field_id/parcel/:parcel_id/humidity/:id' => 'humidity#update'
      delete      '/field/:field_id/parcel/:parcel_id/humidity/:id' => 'humidity#delete'

      get         '/field/:field_id/parcel/:parcel_id/temperatures'     => 'temperature#index'
      post        '/field/:field_id/parcel/:parcel_id/temperatures'     => 'temperature#new'
      get         '/field/:field_id/parcel/:parcel_id/temperature/:id'  => 'temperature#get'
      put         '/field/:field_id/parcel/:parcel_id/temperature/:id'  => 'temperature#update'
      delete      '/field/:field_id/parcel/:parcel_id/temperature/:id'  => 'temperature#delete'

      get         '/field/:field_id/parcel/:parcel_id/moistures'     => 'moisture#index'
      post        '/field/:field_id/parcel/:parcel_id/moistures'     => 'moisture#new'
      get         '/field/:field_id/parcel/:parcel_id/moisture/:id'  => 'moisture#get'
      put         '/field/:field_id/parcel/:parcel_id/moisture/:id'  => 'moisture#update'
      delete      '/field/:field_id/parcel/:parcel_id/moisture/:id'  => 'moisture#delete'

      get         '/field/:field_id/crops'          => 'crop#index'
      post        '/field/:field_id/crops'          => 'crop#new'
      get         '/field/:field_id/crops/lastest'  => 'crop#lastest'
      get         '/field/:field_id/crop/:id'       => 'crop#get'
      put         '/field/:field_id/crop/:id'       => 'crop#update'
      delete      '/field/:field_id/crop/:id'       => 'crop#delete'

      get         '/field/:field_id/weathers'         => 'weather#index'
      post        '/field/:field_id/weathers'         => 'weather#new'
      get         '/field/:field_id/weathers/lastest' => 'weather#lastest'
      get         '/field/:field_id/weather/:id'      => 'weather#get'
      delete      '/field/:field_id/weather/:id'      => 'weather#delete'
      get         '/actions/weather/gather'           => 'weather#create_all'
    end
  end
end
