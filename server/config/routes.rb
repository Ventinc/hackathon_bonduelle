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
    end
  end
end
