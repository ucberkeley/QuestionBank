QuestionBank::Application.routes.draw do
  resources :users

	resources :attempts
  	resources :questions
  	resources :tags
  	match ':controller/:action'

  	match 'auth/:provider/callback', to: 'sessions#create'
  	match 'auth/failure', to: redirect('/')
  	match 'signout', to: 'sessions#destroy', as: 'signout'

  	get 'home/index'
	root :to => "home#index"
end
