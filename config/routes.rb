Rails.application.routes.draw do
  get 'users/newUer'
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"

    get "/help", to: "static_pages#help"
    get "/login", to: "static_pages#login"
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    resource :user , only: %i(new create)
  end
end
