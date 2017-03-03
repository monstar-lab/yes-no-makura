Rails.application.routes.draw do
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
