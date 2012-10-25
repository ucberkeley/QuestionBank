QuestionBank::Application.routes.draw do
  resources :attempts

  get "home/index"
  get "questions/generate_quiz" => "questions#generate_quiz"
  resources :questions

  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'


  root :to => "home#index"


end
