class Auth::Devise::PasswordsController < Devise::PasswordsController
  param_accessible user: [:email], only: :create
  param_accessible :reset_password_token, only: :edit
  param_accessible user: [:password, :password_confirmation, :reset_password_token], only: :update
end