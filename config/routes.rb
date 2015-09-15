Rails.application.routes.draw do

	resources :products, :events

	root to: 'welcome#index', as: 'welcome'
	match "*path", to: "application#catch_404", via: :all
end
