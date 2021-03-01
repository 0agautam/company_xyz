Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "employees#index"

  get 'employees', to:'employees#index'
  resources :employees

  #get "/admindep", to:"admin_of_departments#index"

  # scope '/admin' do
  #   resources :admin_of_departments
  # end
  # scope module: 'admin' do
  #   resources :admin_of_departments
  # end

  resources :admin_of_departments, path:'/admin/admin_of_departments', as: 'Owner'

  # resources :departments do
  #   resources :projects, shallow: true
  # end
   
  # resources :departments, shallow:true do
  #   resources :projects
  # end
   
  # resources :departments do
  #   resources :projects, only: [:index,:new,:create]
  # end

  # resources :projects, only: [:show,:edit,:update,:destroy,]  
  # shallow do
  # 	resources :departments do
  # 	  resources :projects
  # 	end
  # end

  # scope shallow_prefix: "sekret" do
  # 	resources :departments do
  # 		resources :projects, shallow: true
  # 	end
  # end

  # concern :commentable do
  #   resources :projects
  # end


  # concern :image_attachable do
  #   resources :images, only: :index
  # end

  # resources :projects, concerns: [:commentable, :image_attachable]


end
