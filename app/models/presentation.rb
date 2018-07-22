class Presentation < ApplicationRecord
  belongs_to :comment
  belongs_to :presentation_item
end
