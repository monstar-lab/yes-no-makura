Rails.application.routes.draw do

  root              'answers#home'
  get   'start'  => 'question_masters#start'
  get   'question/:question_id' => 'questions#show'

  resources :questions
  resources :number_of_participants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
