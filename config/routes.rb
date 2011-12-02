Devicraft::Application.routes.draw do
  get "dashboard/index", as: :dashboard
  get "dashboard/start", as: :start_dashboard
  get "dashboard/stop", as: :stop_dashboard
  post "dashboard/say", as: :say_dashboard
  post "dashboard/give", as: :give_dashboard

  root :to => 'dashboard#index'
end
