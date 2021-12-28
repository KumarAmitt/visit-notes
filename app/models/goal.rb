class Goal < ApplicationRecord
  has_many :sub_goals, dependent: :destroy

  has_many :plan_of_cares
  has_many :patients, through: :plan_of_cares
end
