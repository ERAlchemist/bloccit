Rails.application.routes.draw do

  #get 'questions/index'

  #get 'questions/show'

  #get 'questions/new'

  #get 'questions/edit'

  #resources :advertisements


  resources :topics do
    
 	resources :posts, except: [:index]
      end
	resources :users, only: [:new, :create]
	#resources :questions

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
