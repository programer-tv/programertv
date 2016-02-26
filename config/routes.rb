Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: "users/registrations",
  }

	authenticated :user do
    root "main#all", as: :authenticated_root
  end

  unauthenticated :user do
    root "static_pages#home"
  end

  resources :users, only: [:index, :show]

  resources :courses do
    resources :episodes, except: [:index]
  end

  resources :articles
  resources :videos

  get "privacy", to: "static_pages#privacy"
  get "terms", to: "static_pages#terms"
  get "faq", to: "static_pages#faq"

  get 'searches/index', as: "search", path: "search"

  mount Ckeditor::Engine => '/ckeditor'

  %w( 404 422 500 503 ).each do |code|
    get code, to: "errors#show", code: code
  end
end
