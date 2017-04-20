Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '/api' do
    scope '/v1' do
      get         '/fields'     => 'field#index'
      post        '/fields'     => 'field#new'
      get         '/field/:id'  => 'field#get'
      put         '/field/:id'  => 'field#update'
      delete      '/field/:id'  => 'field#delete'
    end
  end
end
