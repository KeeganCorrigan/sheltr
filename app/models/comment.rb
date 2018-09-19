class Comment < ApplicationRecord
  validates_presence_of :place_id, :body
end
