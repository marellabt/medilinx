Rails.application.routes.draw do

  # Routes for the Patient_profile resource:
  # CREATE
  get "/patient_profiles/new", :controller => "patient_profiles", :action => "new"
  post "/create_patient_profile", :controller => "patient_profiles", :action => "create"

  # READ
  get "/patient_profiles", :controller => "patient_profiles", :action => "index"
  root to: "patient_profiles#index"
  get "/patient_profiles/:id", :controller => "patient_profiles", :action => "show"


  # UPDATE
  get "/patient_profiles/:id/edit", :controller => "patient_profiles", :action => "edit"
  post "/update_patient_profile/:id", :controller => "patient_profiles", :action => "update"

  # DELETE
  get "/delete_patient_profile/:id", :controller => "patient_profiles", :action => "destroy"
  #------------------------------

  devise_for :users
  #Routes for users
  #READ
  get "/users", :controller => "users", :action => "show"
  get "users/:id", :controller => "users", :action => "read"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end