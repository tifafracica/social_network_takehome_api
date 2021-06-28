Rails.application.routes.draw do
  root :to => "api/v1/socialnetworks#make_api_response"
  namespace :api do
    namespace :v1 do
      resources :socialnetworks
      get '/sm_data', to: "socialnetworks#make_api_response"
    end
   end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
