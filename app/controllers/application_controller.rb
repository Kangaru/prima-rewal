class ApplicationController < ActionController::Base
  protect_from_forgery

  has_widgets do |root|
    root << widget(:reservation_form)
  end
end
