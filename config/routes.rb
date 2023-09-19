Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Home
  root "items#index"

  # items
  resources :items

  # baskets
  resources :baskets

  # checkouts
  resources :checkouts, only: [:show, :destroy]

  # rules
  resources :rules, only: [:show, :index, :create, :destroy]
  post "/rules/:id", to: "rules#update", as: "activate_rule" 

  # coupon_discounts
  namespace 'rules' do
    resources :coupon_discounts, only: [:new, :show, :create, :destroy], controller: 'coupon_discounts'
  end

  # price_discounts
  namespace 'rules' do
    resources :price_discounts, only: [:new, :show, :create, :destroy], controller: 'price_discounts'
  end

  # bulk_discounts
  namespace 'rules' do
    resources :bulk_discounts, only: [:new, :show, :create, :destroy], controller: 'bulk_discounts'
  end

  # basket_items
  resources :basket_items
  post "/basket_items/:item_id", to: "basket_items#create", as: "add_to_basket"
end
