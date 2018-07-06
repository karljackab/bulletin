Rails.application.routes.draw do
	resources :events do
		collection do
			post :del_all
		end
	end
	resources :users
	get "/" => "events#index"
end
