QuestionBank::Application.routes.draw do
	match ':controller/:action'
	resources :attempts
  	resources :questions

  	match 'auth/:provider/callback', to: 'sessions#create'
  	match 'auth/failure', to: redirect('/')
  	match 'signout', to: 'sessions#destroy', as: 'signout'


	root :to => "home#index"
end
