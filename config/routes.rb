Devicraft::Application.routes.draw do
  devise_for :craftsmen

  get "home/index", as: :home

  get "dashboard/index", as: :dashboard
  get "dashboard/start", as: :start_dashboard
  get "dashboard/stop", as: :stop_dashboard
  post "dashboard/say", as: :say_dashboard
  post "dashboard/give", as: :give_dashboard

  root :to => 'home#index'
end
