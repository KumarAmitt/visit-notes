class PlanOfCare < ApplicationRecord
  belongs_to :patient
  belongs_to :goal
end
