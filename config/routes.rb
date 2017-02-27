Rails.application.routes.draw do
  root 'answers#new'

  resources :answers, only: %i(create)
  resources :questions do
    get   :propose,    on: :member
    patch :close,      on: :member
    get   :result,     on: :member
    get   :over,       on: :collection
    get   :init_all,   on: :collection
    get   :delete_all, on: :collection
  end
end
