Rails.application.routes.draw do

  devise_for :users
   # ユーザーの編集と詳細
  resources :users, only: [:edit, :show, :update, :index]
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]

  root to: "homes#top"
  get "/about" => "homes#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
