Rails.application.routes.draw do
  root 'application#index'
  get 'small_sat/distributed_systems', to: 'small_sat#distributed_systems',
                                       path: 'small-sat/distributed-systems'
  get 'small_sat/about', to: 'small_sat#about',
                         path: 'small-sat/about'
  get 'small_sat/missions'
  get 'small_sat/intersatellite_communications'
  get 'small_sat/design_parameters'
  get 'small_sat/signup', to: 'users#new', path: 'small-sat/signup'
  resources :users, path: 'small-sat/users'
end
