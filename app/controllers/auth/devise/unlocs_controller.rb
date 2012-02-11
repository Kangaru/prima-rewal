class Auth::Devise::UnlocksController < Devise::UnlocksController
  param_accessible user: [:email], only: :create
end