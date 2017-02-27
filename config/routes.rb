Rails.application.routes.draw do
  root 'answers#new'

  resources :answers,                only:   %i(create)
  resources :number_of_participants, except: %i(show)
  resources :questions do
    get :propose,    on: :member
    get :result,     on: :member
    get :over,       on: :collection
    get :init_all,   on: :collection
    get :delete_all, on: :collection
  end
end
