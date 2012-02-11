class Auth::Devise::SessionsController < Devise::SessionsController
  param_accessible user: [:email, :password, :remember_me]
end