Rails.application.routes.draw do

	resources :products, :events

	scope path: '/about', controller: :about do
		get 'cash' => :cash, as: 'about_cash'
		get 'contacts' => :contacts, as: 'about_contacts'
		get 'delivery' => :delivery, as: 'about_delivery'
		get 'responces' => :responces, as: 'about_responces'
		get '' => :about, as: 'about'
	end

	scope controller: :shop do
		get 'event/all' => :events, as: 'shop_events'
		get 'event/:event' => :event, as: 'shop_event'
		get 'product/:product' => :product, as: 'shop_product'
		get ':category' => :category, as: 'shop_category'
	end

	root to: 'welcome#index', as: 'welcome'
	match "*path", to: "application#catch_404", via: :all
end
