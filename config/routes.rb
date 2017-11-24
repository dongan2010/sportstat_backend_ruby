Rails.application.routes.draw do

  scope :api, module: :api, defaults: { format: :json } do
    scope :v1, module: :v1 do
      get '/goals' => 'goals#index'
      get '/clubs' => 'clubs#index'
      get '/seasons' => 'seasons#index'
      get '/tournaments' => 'tournaments#index'
    end
  end

end
