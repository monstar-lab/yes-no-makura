Rails.application.routes.draw do
  root 'answers#new'

  resources :answers, only: %i(create)

  get    'result/:id'               =>  'questions#result'
  delete 'destroy/questions'        =>  'questions#all_destroy'
  get    'init/questions'           =>  'questions#all_init'
  get    'admin/questions/:id'      =>  'questions#admin_show'
  put    'close_questions/:id'      =>  'questions#close'
  get    'not_find'                 =>  'questions#not_find'

  resources :questions
  resources :number_of_participants, except: %(show)
end
