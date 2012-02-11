class Auth::Devise::RegistrationsController < Devise::RegistrationsController
  param_accessible user: [:email, :password, :password_confirmation], only: [:create, :update]
  param_accessible user: [:current_password], only: :update
end