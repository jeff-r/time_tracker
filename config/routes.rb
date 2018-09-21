Rails.application.routes.draw do
  devise_for :users
  root to: "projects#index"
  resources :events
  resources :projects

  get "/projects/:id/start_clock", to: 'projects#start_clock', as: :start_clock
  get "/projects/:id/stop_clock", to: 'projects#stop_clock', as: :stop_clock
  get "/projects/:id/events", to: 'projects#events', as: :project_events
end
