Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # blogs/delete_blog/7
  get "/blogs", to: "blogs#blog_list"
  post "/blogs/create_blog", to: "blogs#create_blog"
  delete "/blogs/delete-blog/:id", to: "blogs#delete_blog"
  put "/blogs/update_blog/:id", to: "blogs#update_blog"
  get "/blogs/search_blog", to: "blogs#search_blog"

  get "/users", to: "users#user_list"
  post "users/create_user", to: "users#create_user"
  get "users/search_user", to: "users#search_user"
  delete"users/delete_user", to: "users#delete_user"
  put "users/update_user", to: "users#update_user"

  post "/users/login", to: "users#login"

end
