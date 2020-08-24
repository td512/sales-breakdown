Rails.application.routes.draw do
  root 'public#index'
  namespace :api do
    namespace :v1 do
      resources :transactions, only: [:index, :show], defaults: {format: :json}, :constraints => {:id => /[^\/]+/}
    end
  end
end
