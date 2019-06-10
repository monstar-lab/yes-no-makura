Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'answers#new'

  get :admin, to: 'application#admin'
  resources :answers, only: %i(create) do
    delete :delete_all, on: :collection
  end

  resources :questions do
    get    :propose,    on: :member
    patch  :close,      on: :member
    get    :result,     on: :member
    get    :over,       on: :collection
    patch  :init_all,   on: :collection
    delete :delete_all, on: :collection
  end
end
