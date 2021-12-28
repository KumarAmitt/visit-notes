class Patient < ApplicationRecord
  has_many :plan_of_cares
  has_many :goals, through: :plan_of_cares
end
