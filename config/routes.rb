Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#root'
  get '/get_gift', to: 'pages#get_gift'
  post '/get_gift', to: 'pages#get_gift_post'
  get '/about', to: 'pages#about'

  scope module: 'private' do
    resources :gifts
  end

  get '/my_gifts/:access_hash', to: 'public/gifts#index', as: :public_gifts
  get '/my_gifts/:access_hash/:id', to: 'public/gifts#show', as: :public_gift
end
