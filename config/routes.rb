Rails.application.routes.draw do
  resources :applications, param: :token, except: %i[destroy] do
    resources :chats, param: :number, except: %i[update destroy] do
      resources :messages, param: :number, except: %i[destroy]
      get 'search', to: 'chats#search'
    end
  end
end
