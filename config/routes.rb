=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end

Rails.application.routes.draw do
  root to: "main#index"
  get "/auth/:provider/callback" => "sessions#create"
  get "/signin" => "sessions#new", :as => :signin
  get "/signout" => "sessions#destroy", :as => :signout
  get "/auth/failure" => "sessions#failure"
  
  namespace :api do
    namespace :v1 do
      resources :users, only: [:show]
      resources :goals, only: [:create, :update, :destroy]
    end
  end

  resources :goals,
    except: %(index show),
    constraints: { id: /\d+/} do

    collection do
      metric_exists = lambda do |request|
        name = request[:provider_name]
        PROVIDERS[name]&.find_metric(request[:metric_key])
      end

      get ':provider_name/:metric_key/:id',
        constraints: metric_exists,
        action: :edit,
        as: :edit

      post 'reload', action: :reload, as: :reload
    end
  end
  resources :credentials,
    except: %(index show),
	constraints: { id: /\d+/} do

    collection do
      provider_exists = lambda do |request|
        name = request[:provider_name]
        PROVIDERS[name]
      end

      get ':provider_name',
        constraints: provider_exists,
        action: :edit,
        as: :edit
    end
  end
  
  post 'callback/reload_goal', controller: :callback, action: :reload_slug
end
