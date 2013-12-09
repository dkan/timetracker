Timetracker::Application.routes.draw do

  devise_for :users

  authenticated :user do
    root to: "users#show", :as => "dashboard"
  end

  devise_scope :user do
    root :to => "static_pages#home"
  end

end
