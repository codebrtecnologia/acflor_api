# config/routes.rb
Rails.application.routes.draw do
  localized do
    mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks], controllers: { sessions: "sessions" }
    resources :ability_actions
    resources :ability_permissions
    resources :ability_profiles
    resources :ability_resources
    resources :courses
    resources :entities
    resources :diciplines
    resources :deficiencies
    resources :entity_addresses
    resources :user_addresses
    resources :teams
    resources :teachers
    resources :classes
    resources :appointments, defaults: {format: :json} do
      collection do
        get :situations
        get :repetitions
      end
    end
    resources :events, defaults: {format: :json} do
      collection do
        get '/:id/participantes', to: 'events#get_all_attendances_by_event'
        get '/:id/participantes/:attendance_id', to: 'events#show_attendance_by_event'
        get '/:id/orgaos', to: 'events#get_all_event_bodies_by_event'
        get '/:id/orgaos/:event_body_id', to: 'events#show_event_body_by_event'
        get '/:id/datas', to: 'events#get_all_event_dates_by_event'
        get '/:id/datas/:event_date_id', to: 'events#show_event_date_by_event'
        put '/:id/ativar_evento', to: 'events#activate_event'
        put '/:id/inativar_evento', to: 'events#disable_event'
      end
    end
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