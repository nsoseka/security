Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root to: 'ui#home'

  root to: "pages#front"
  get 'ui(/:action)', controller: 'ui'
  get 'home', to: "citizens#index"
  get 'register', to: "agents#new"
  get 'sign_in', to: "sessions#new"
  get 'sign_out', to: "sessions#destroy"

  resources :citizens, except: [:delete] do
    [:convocations, :flags, :restrictions, :convictions].each do |asset|
      resources asset, only: [:create, :show, :update]
    end
  end
end
