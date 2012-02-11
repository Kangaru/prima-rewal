class Auth::Devise::ConfirmationsController < Devise::ConfirmationsController
  param_accessible user: [:email], only: :create
end