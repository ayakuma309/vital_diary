Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #topページ
  root 'static_pages#top'
  get 'terms', to: 'static_pages#terms'
  get 'privacy', to: 'static_pages#privacy'

  #user新規登録
  resources :users, only: %i[new create]

  #ログイン
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  #バイタル
  resources :vitals do
    resource :defecations, only: %i[create destroy]
    resources :comments, only: %i[create destroy],shallow: true
  end
  resource :profile, only: %i[show edit update]
  #既往歴
  resources :medical_histories, except: [:index, :show]
end
