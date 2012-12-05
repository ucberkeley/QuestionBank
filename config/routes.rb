QuestionBank::Application.routes.draw do
  resources :user_groups

  resources :question_groups

  resources :tags

  resources :attempts

  resources :questions

  get '/questions/quiz/new' => 'questions#prepare_quiz', :as => 'prepare_quiz'
  post '/questions/quiz/new'=> 'questions#generate_quiz', :as => 'generate_quiz'
  match '/questions/quiz/tag/:tag/num/:number_of_questions/show' => 'questions#show_quiz', :as => 'show_quiz'

  get '/downloads/new' => 'downloads#new', :as => 'new_download'
  post '/downloads' => 'downloads#create', :as => 'create_download'

  get '/uploads/new' => 'uploads#new', :as => 'new_upload'
  post '/uploads' => 'uploads#create', :as => 'create_upload'
  get '/uploads/attribute/new' => 'uploads#new_attribute', :as => 'new_attribute'
  post '/uploads/attribute/new' => 'uploads#create_attribute', :as => 'create_attribute'

  post '/api/event/new' => 'api#new_event'
  
  root :to => "home#index"
  resources :users, :only => [:index, :show, :edit, :update ]
  match '/auth/:provider/callback' => 'sessions#create'
  match '/signin' => 'sessions#new', :as => :signin
  match '/signout' => 'sessions#destroy', :as => :signout
  match '/auth/failure' => 'sessions#failure'
end