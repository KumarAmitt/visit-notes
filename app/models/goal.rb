class Goal < ApplicationRecord
  has_many :sub_goals, dependent: :destroy
end
