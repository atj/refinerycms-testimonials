Refinery::Application.routes.draw do
  resources :testimonials, :only => [:index]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :testimonials do
      collection do
        post :update_positions
      end
    end
  end
end
