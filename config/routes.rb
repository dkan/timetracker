Timetracker::Application.routes.draw do

  devise_scope :user do
    root :to => "static_pages#home"
  end

  devise_for :users

  authenticated :user do
    root to: "users#show", :as => "dashboard"
  end

end
