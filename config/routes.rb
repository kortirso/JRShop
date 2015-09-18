Rails.application.routes.draw do

	resources :products, :events

	scope controller: :shop do
		get 'event/:event' => :event, as: 'shop_event'
		get 'product/:product' => :product, as: 'shop_product'
		get ':category' => :category, as: 'shop_category'
	end

	root to: 'welcome#index', as: 'welcome'
	match "*path", to: "application#catch_404", via: :all
end
