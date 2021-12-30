class Comment < ApplicationRecord
  belongs_to :patient
  belongs_to :sub_goal
end
