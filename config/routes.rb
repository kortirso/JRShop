Rails.application.routes.draw do

	root to: 'welcome#index', as: 'welcome'
	match "*path", to: "application#catch_404", via: :all
end
