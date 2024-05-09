Rails.application.routes.draw do
  localized do
    mount_devise_token_auth_for 'User', at: 'auth'
    resources :ability_actions
    resources :ability_permissions
    resources :ability_profiles
    resources :ability_resources
    resources :agenda_requests, defaults: {format: :json} do
      collection do
        get :statuses
        put '/:id/aprovar_solicitacao', to: 'agenda_requests#approve_request'
      end
    end
    resources :attendances
    resources :categories
    resources :cities
    resources :events, defaults: {format: :json} do
      collection do
        put '/:id/ativar_evento', to: 'events#activate_event'
        put '/:id/inativar_evento', to: 'events#disable_event'
      end
    end
    resources :holidays, defaults: {format: :json} do
      collection do
        get :holiday_types
      end
    end
    resources :people
    resources :public_bodies
    resources :users do
      collection do
        get '/list_names', to: 'users#list_names'
        put '/set_email/:id', to: 'users#set_email'
      end
    end
    resources :password do
      collection do
        put '/send_email_token', to: 'password#send_email_token'
        put '/reset_password', to: 'password#reset_password'
      end
    end

    get '/logs', to: 'logs#show', defaults: { format: :html }
  end
end
