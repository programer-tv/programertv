Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: "users/registrations",
  }

	authenticated :user do
    root "courses#index", as: :authenticated_root
  end

  unauthenticated :user do
    root "static_pages#home"
  end

  resources :users, only: [:index, :show]

  resources :courses do
    resources :episodes, except: [:index]
  end

  resources :articles

  get "privacy", to: "static_pages#privacy"
  get "terms", to: "static_pages#terms"
  get "faq", to: "static_pages#faq"

  get 'searches/index', as: "search", path: "search"

  mount Ckeditor::Engine => '/ckeditor'
end
