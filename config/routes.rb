# encoding: UTF-8
SampleApp::Application.routes.draw do
  

  match '/', :to => 'pages#home'
  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'
  match '/help',    :to => 'pages#help'
  match '/signup',  :to => 'users#new'
  match '/show',  :to => 'users#show'
  match '/showUserList',  :to => 'users#showUserList'
  match '/showNonSportifList',  :to => 'users#showNonSportifList'


  resources :users
  root :to => 'pages#home'

end
