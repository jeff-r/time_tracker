Rails.application.routes.draw do
  root to: "projects#index"
  resources :events
  resources :projects
end
