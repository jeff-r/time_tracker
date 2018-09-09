Rails.application.routes.draw do
  root to: "projects#index"
  resources :events
  resources :projects

  get "/projects/:id/start_clock", to: 'projects#start_clock', as: :start_clock
  get "/projects/:id/stop_clock", to: 'projects#stop_clock', as: :stop_clock
end
