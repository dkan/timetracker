Timetracker::Application.routes.draw do

  root :to => "static_pages#home"

  devise_for :users

  authenticated :user do
    root to: "users#show", :as => "dashboard"
  end

end
