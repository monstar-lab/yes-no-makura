Rails.application.routes.draw do


  root                                 'answers#home'
  get   'start'                    =>  'question_masters#start'
  #get   'questions/:id'            =>  'questions#show'
  get   'result/:id'               =>  'questions#result'
  put   'close_questions/:id'      =>  'questions#close'
  post  'agree'                    =>  'answers#agree'
  post  'disagree'                 =>  'answers#disagree'


  resources :questions
  resources :number_of_participants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
