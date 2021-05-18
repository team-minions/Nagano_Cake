Rails.application.routes.draw do
  scope module: :public do
    devise_for :customers
    root to: "homes#top"
    resource :customers
    resources:products,only: [:index, :show]
    resources:cart_items,only: [:index, :create,:update, :destroy]
    resources:deliveries,only: [:index, :create, :edit, :update, :destroy]
    resources:oders,only: [:new, :create, :index, :show]
    post "orders/confirm"=> "oders#confirm"
    get "orders/complete"=> "oders#complete"
    get "customers/retire" => "cutomers#retilre"
    get "homes/about" => "homes#about"
    delete "carts_items/destroy_all" => "carts_items#destroy_all"
    patch "customers/retire" => "customers#confirm"
  end

  namespace :admin do
   devise_for :admins
   resources:customers,only: [:index, :show, :edit, :update]
   resources:products,only: [:index, :show, :new, :create, :edit, :update]
   resources:oders,only: [:index, :show, :update]
   resources:genres,only: [:index, :edit, :create, :update]
   resources:order_items,only: [:update]
 end
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
