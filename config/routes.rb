QuestionBank::Application.routes.draw do
  resources :student_groups

  resources :question_sets

  resources :tags

  resources :attempts

  resources :questions

  get '/questions/quiz/new' => 'questions#prepare_quiz', :as => 'prepare_quiz'
  post '/questions/quiz/new'=> 'questions#generate_quiz', :as => 'generate_quiz'
  match '/questions/quiz/tag/:tag/num/:number_of_questions/show' => 'questions#show_quiz', :as => 'show_quiz'

  root :to => "home#index"
  resources :users, :only => [:index, :show, :edit, :update ]
  match '/auth/:provider/callback' => 'sessions#create'
  match '/signin' => 'sessions#new', :as => :signin
  match '/signout' => 'sessions#destroy', :as => :signout
  match '/auth/failure' => 'sessions#failure'
end
