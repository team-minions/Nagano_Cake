Rails.application.routes.draw do

  devise_for :admin, skip: :all
   devise_scope :admin do
     get "/admin/sign_in", to: "admin/sessions#new",as: :new_admin_session
     post "/admin/sign_in", to: "admin/sessions#create",as: :admin_session
     delete "/admin/sign_out", to: "admin/sessions#destroy",as: :destroy_admin_session
   end

  devise_for :customers, skip: :all
   devise_scope :customer do
    get '/customers/sign_up', to: 'public/registrations#new', as: :new_customer_registration
    post '/customers', to: 'public/registrations#create', as: :customer_registration
    get "/customers/sign_in", to: "public/sessions#new", as: :new_customer_session
    post "/customers/sign_in", to: "public/sessions#create",as: :customer_session
    delete "/customers/sign_out", to: "public/sessions#destroy",as: :destroy_customer_session
  end

  scope module: :public do
    root to: "homes#top"
    resource :customers
    get "orders/complete"=> "orders#complete"
    post "orders/confirm"=> "orders#confirm"
    resources:products,only: [:index, :show]
    delete "cart_items/destroy_all" => "cart_items#destroy_all"
    resources:cart_items,only: [:index, :create,:update, :destroy]
    resources:deliveries,only: [:index, :create, :edit, :update, :destroy]
    resources:orders,only: [:new, :create, :index, :show]
    
    patch "customers/retire" => "customers#retire"
    get "/about" => "homes#about"
    delete "carts_items/destroy_all" => "carts_items#destroy_all"
    get "customers/confirm" => "customers#confirm"
  end

  namespace :admin do
   # adminログイン後遷移ページ
   root :to => "orders#index"
   resources:customers,only: [:index, :show, :edit, :update]
   resources:products,only: [:index, :show, :new, :create, :edit, :update]
   resources:orders,only: [:index, :show, :update]
   resources:genres,only: [:index, :edit, :create, :update]
   resources:order_items,only: [:update]
 end
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
