Rails.application.routes.draw do

  #get 'questions/index'

  #get 'questions/show'

  #get 'questions/new'

  #get 'questions/edit'

  resources :advertisements

  resources :posts
	
	resources :questions

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
