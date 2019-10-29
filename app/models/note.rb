class Note < ApplicationRecord
  belongs_to :comment, inverse_of: :note, optional: true
end
