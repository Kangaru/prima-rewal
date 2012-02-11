class Flatpage < ActiveRecord::Base
  translates :title, :content
end
