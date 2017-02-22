Rails.application.routes.draw do

  root                                 'answers#home'
  get    'start'                    =>  'question_masters#start'
  get    'result/:id'               =>  'questions#result'
  get    'admin/questions/:id'      =>  'questions#admin_show'
  delete 'destroy/questions'        =>  'questions#all_destroy'
  get    'init/questions'        =>  'questions#all_init'
  put    'close_questions/:id'      =>  'questions#close'
  post   'agree'                    =>  'answers#agree'
  post   'disagree'                 =>  'answers#disagree'
  get    'not_find'                 =>  'questions#not_find'

  resources :questions
  resources :number_of_participants

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
