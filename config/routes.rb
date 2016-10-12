Rails.application.routes.draw do

  root              'answers#home'
  get   'start'  => 'question_masters#start'
  get   'questions/:id' => 'questions#show'
  get   'result/:id' => 'question_masters#result'
  get   'close_questions/:id' =>  'question_masters#close_questions'

  resources :questions
  resources :number_of_participants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
