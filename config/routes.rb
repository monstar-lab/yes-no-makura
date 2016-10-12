Rails.application.routes.draw do

  get 'start'  => 'question_masters#start'
  
  resources :questions
  resources :number_of_participants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
