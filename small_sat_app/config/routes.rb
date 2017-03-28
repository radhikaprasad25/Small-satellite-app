Rails.application.routes.draw do
  get 'small_sat/distributed_systems'

  get 'small_sat/about', to: 'small_sat#about'

  get 'small_sat/missions'

  get 'small_sat/intersatellite_communications'

  get 'small_sat/design_parameters'

  root 'application#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
