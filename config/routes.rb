QuestionBank::Application.routes.draw do
  resources :user_groups

  resources :question_groups

  resources :tags

  resources :attempts

  resources :questions

  get '/questions/quiz/new' => 'questions#prepare_quiz', :as => 'prepare_quiz'
  post '/questions/quiz/new'=> 'questions#generate_quiz', :as => 'generate_quiz'
  match '/questions/quiz/tag/:tag/num/:number_of_questions/show' => 'questions#show_quiz', :as => 'show_quiz'

  get '/queries/prepare_to_get_attempts' => 'queries#prepare_to_get_attempts', :as => 'prepare_to_get_attempts'
  post '/queries/get_attempts' => 'queries#get_attempts'

  root :to => "home#index"
  resources :users, :only => [:index, :show, :edit, :update ]
  match '/auth/:provider/callback' => 'sessions#create'
  match '/signin' => 'sessions#new', :as => :signin
  match '/signout' => 'sessions#destroy', :as => :signout
  match '/auth/failure' => 'sessions#failure'
end